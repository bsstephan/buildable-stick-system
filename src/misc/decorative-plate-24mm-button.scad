/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module button_24mm_decorative_plate() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		translate([0, 0, -55]) button_24mm_hole();
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([0, 0, -1]) button_24mm_hole();
	}
}

button_24mm_decorative_plate();
