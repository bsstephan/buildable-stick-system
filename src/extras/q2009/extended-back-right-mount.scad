/* A back piece of the enclosure, with a mounting hole.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <extended-back-left-mount.scad>

module right_mount_extended_back() {
	mirror([1, 0, 0]) left_mount_extended_back();
}

right_mount_extended_back();
