/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <extended/side.scad>

module interconnect_frame_half_piece() {
	translate([frame_x/2-frame_wall, 0, 0]) difference() {
		side_frame_piece();
		rotate([0, 0, 180]) side_chopper();
	}
}

module interconnect_frame_piece() {
	difference() {
		union() {
			// slight translate is to make this a 2-manifold in OpenSCAD
			translate([-0.01, 0, 0]) interconnect_frame_half_piece();
			mirror([1, 0, 0]) interconnect_frame_half_piece();
		}
		translate([-frame_x/2, 0, 0]) frame_cable_routing_hole();
	}
}

interconnect_frame_piece();
