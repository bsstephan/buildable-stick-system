/* Decorative plate for ergo WASD directional buttons.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
include <components.scad>

module ergo_wasd_five_30mm_plate_decorative_plate() {
	difference() {
		hull() difference() {
			// get a 2mm slice of the decorative button cylinders
			translate([0, 0, -50]) ergo_wasd_seven_30mm();
			translate([0, 0, -100]) cube([500, 500, 198], center=true);
			translate([0, 0, 100]) cube([500, 500, 198], center=true);
		}
		// cut out the normal holes
		translate([0, 0, -1]) ergo_wasd_five_30mm();
	}
}

ergo_wasd_five_30mm_plate_decorative_plate();
