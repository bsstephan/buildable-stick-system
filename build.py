"""Compile all OpenSCAD files into a build directory and package it with docs.

(a.k.a.: "make is hard"

SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
SPDX-License-Identifier: GPL-3.0-or-later
"""
import os
import os.path
import re
import subprocess

PROJECT_ROOT = os.path.abspath(os.getcwd())
BUILD_DIR = os.path.join(PROJECT_ROOT, 'build/')
SOURCE_DIR = os.path.join(PROJECT_ROOT, 'src/')

EXCLUDES = ['components.scad', 'parameters.scad']

# set up our environment to point openscad at the right stuff
os.environ['OPENSCADPATH'] = SOURCE_DIR

# track processes to wait on
processes = []

os.chdir(SOURCE_DIR)
for root, dirs, files in os.walk('.'):
    print(f"{root} {dirs} {files}")
    # make the current directory so that openscad can write stuff into it
    try:
        os.makedirs(os.path.join(BUILD_DIR, root))
    except FileExistsError:
        pass

    input_dir = os.path.join(SOURCE_DIR, root)
    output_dir = os.path.join(BUILD_DIR, root)
    for file in files:
        if not re.match(r'.*\.scad$', file):
            continue
        if file in EXCLUDES:
            continue

        stl_file = re.sub(r'\.scad$', '.stl', file)
        input_ = os.path.join(input_dir, file)
        output = os.path.join(output_dir, stl_file)
        cmd = f'openscad -o {output} {input_}'
        print(cmd)
        processes.append(subprocess.Popen(cmd.split(' ')))

for process in processes:
    process.wait()
    if process.returncode != 0:
        raise Exception(f"building {process.args} failed")
