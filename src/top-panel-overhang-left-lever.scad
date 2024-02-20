/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

// combine the lever mount and generic plate, with mounting holes
module top_panel_left_lever() {
	difference() {
		// base plate
		panel_with_raised_overhang();
		// holes to mount the lever
		translate([0, 20, 0]) levermountholes();
		translate([0, 20, 0]) levermountcountersinks();
		side_chopper();
	}
}

top_panel_left_lever();
