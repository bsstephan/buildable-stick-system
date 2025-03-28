/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_plate() {
	difference() {
		// get a 2mm slice of the jumbo decorative button cylinders
		union() {
			translate([-panel_x/2, 0, -70]) dir_arc_w_30mm();
			translate([panel_x/2, 0, -70]) sega_2p_nine();
		}
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([-panel_x/2, 0, -1]) dir_arc_w_30mm();
		translate([panel_x/2, 0, -1]) sega_2p_nine();
	}
}

dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_plate();
