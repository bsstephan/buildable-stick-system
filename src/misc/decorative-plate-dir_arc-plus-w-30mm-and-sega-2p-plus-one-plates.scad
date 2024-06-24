/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
jumbo_decorative_radius_scale = 0;
include <components.scad>

module dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate_of_plates() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		union() {
			translate([-panel_x/2, 0, -25]) hull() dir_arc_w_30mm();
			translate([panel_x/2, 0, -25]) hull() sega_2p_plus_one();
		}
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([-panel_x/2, 0, -1]) dir_arc_w_30mm();
		translate([panel_x/2, 0, -1]) sega_2p_plus_one();
	}
}

dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate_of_plates();
