/* A rounded corner decorative plate for the Sega 2P + 1 button layout.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
include <components.scad>

module sega_2p_nine_decorative_plate_of_plates() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		union() {
			translate([panel_x/2, 0, -25]) hull() sega_2p_nine();
		}
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([panel_x/2, 0, -1]) sega_2p_nine();
	}
}

sega_2p_nine_decorative_plate_of_plates();
