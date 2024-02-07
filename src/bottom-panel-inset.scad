/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module bottom_panel() {
	difference() {
		mirror([0, 0, 1]) panel();
		translate([0, 0, top_plate_z/2]) cube([top_plate_x-40, top_plate_y-40, top_plate_z], center=true);
	}
}

bottom_panel();
