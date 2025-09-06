/*
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module ergo_wasd_five_30mm_and_ergo_nine_30mm_decorative_plate() {
	difference() {
		// get a 2mm slice of the jumbo decorative button cylinders
		union() {
			translate([-panel_x/2, 0, -70]) mirror([1, 0, 0]) ergo_wasd_five_30mm();
			translate([panel_x/2, 0, -70]) ergo_nine_30mm();
		}
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([-panel_x/2, 0, -1]) mirror([1, 0, 0]) ergo_wasd_five_30mm();
		translate([panel_x/2, 0, -1]) ergo_nine_30mm();
	}
}

ergo_wasd_five_30mm_and_ergo_nine_30mm_decorative_plate();
