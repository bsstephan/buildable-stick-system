/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module dir_arc_plus_w_24mm_8_button_decorative_plate() {
	difference() {
		// get a 2mm slice of the decorative button cylinders
		translate([0, 0, -50]) dir_arc_plus_w_24mm_8_button();
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([0, 0, -1]) dir_arc_plus_w_24mm_8_button();
	}
}

dir_arc_plus_w_24mm_8_button_decorative_plate();
