/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module top_panel_left_lever_and_dir_arc_w_30mm() {
	difference() {
		union() {
			top_plate_with_raised_overhang();
			translate([(-top_plate_x/2)+55, (top_plate_y/2)-75, -((top_plate_z/2)+(lever_mount_z/2))]) levermountbase();
		}
		dir_arc_w_30mm();
		side_chopper();
		translate([(-top_plate_x/2)+55, (top_plate_y/2)-75, 0]) levermountholes();
	}
}

top_panel_left_lever_and_dir_arc_w_30mm();
