/* Interconnect frames along the x-axis (the longer side)
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/box/front-or-back.scad>

module interconnect_frame_half_piece() {
	translate([0, frame_y/2-frame_wall, 0]) difference() {
		front_or_back_box_frame_piece();
		translate([0, (-frame_y+frame_wall)/2-panel_overhang_amount, 0])
			cube([overhang_panel_x, frame_wall+panel_overhang_amount*2, frame_z], center=true);
	}
}

module interconnect_frame_piece() {
	difference() {
		union() {
			// slight translate is to make this a 2-manifold in OpenSCAD
			translate([0, -0.01, 0]) interconnect_frame_half_piece();
			mirror([0, 1, 0]) interconnect_frame_half_piece();
		}
		rotate([0, 0, 90]) translate([-frame_y/2, 0, 0]) frame_cable_routing_hole();
	}
}

interconnect_frame_piece();
