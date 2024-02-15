/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <misc-neutrik-d-plate.scad>

module aux_control_three_button_cluster_decorative_plate() {
	difference() {
		hull() {
			translate([-44, 0, 0]) neutrik_d_plate();
			translate([44, 0, 0]) neutrik_d_plate();
		}
		translate([0, 0, -10]) aux_control_three_button_cluster();
	}
}

aux_control_three_button_cluster_decorative_plate();
