/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <misc-neutrik-d-plate.scad>

module aux_connectors_two_neutrik_cluster_decorative_plate() {
	difference() {
		hull() {
			translate([-50, 0, 0]) neutrik_d_plate();
			translate([50, 0, 0]) neutrik_d_plate();
		}
		translate([(frame_x/2)-frame_center_to_neutrik-frame_wall, 0, 0]) rocker_20mm_mount();
		translate([-((frame_x/2)-frame_center_to_neutrik-frame_wall), 0, 0]) neutrik_d_mount();
	}
}

aux_connectors_two_neutrik_cluster_decorative_plate();
