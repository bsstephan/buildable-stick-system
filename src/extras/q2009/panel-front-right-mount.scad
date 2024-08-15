/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <panel-front-left-mount.scad>

module front_right_mount_panel() {
	mirror([1, 0, 0]) front_left_mount_panel();
}

front_right_mount_panel();
