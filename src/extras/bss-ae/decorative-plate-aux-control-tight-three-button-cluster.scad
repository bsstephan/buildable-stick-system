/* Decorative plate for aux buttons.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
jumbo_decorative_radius_scale = 0;
include <components.scad>

module aux_control_three_button_tight_cluster_decorative_plate() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		translate([0, 0, -25]) hull() aux_control_three_button_tight_cluster();
		// keep a thin slice
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([0, 0, -1]) aux_control_three_button_tight_cluster();
	}
}

aux_control_three_button_tight_cluster_decorative_plate();
