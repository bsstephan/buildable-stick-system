/* Decorative plate for directional buttons.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
jumbo_decorative_radius_scale = 0;
include <components.scad>

module sega_2p_eleven_plate_decorative_plate() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		translate([panel_x/2, 0, -25]) hull() sega_2p_eleven();
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([panel_x/2, 0, -1]) sega_2p_eleven();
	}
}

sega_2p_eleven_plate_decorative_plate();
