/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module sega_2p_nine_decorative_plate() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		translate([0, 0, -55]) sega_2p_nine();
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([0, 0, -1]) sega_2p_nine();
	}
}

sega_2p_nine_decorative_plate();
