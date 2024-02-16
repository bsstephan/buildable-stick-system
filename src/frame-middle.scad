/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module base_middle_frame() {
	difference() {
		frame();
		// chop the left and right edge off
		side_chopper();
		mirror([1, 0, 0]) side_chopper();
	}
}

module middle_frame() {
	difference() {
		base_middle_frame();
		// connection holes to other frames
		frame_connection_holes();
		mirror([1, 0, 0]) frame_connection_holes();

		// cable routing holes
		frame_cable_routing_hole();
		mirror([1, 0, 0]) frame_cable_routing_hole();

		// neutrik mounts for connector, switches
		translate([0, (frame_y/2)-neutrik_panel_thickness, frame_bottom_bevel_height/2])
			rotate([90, 0, 0]) neutrik_d_mount();
		translate([0, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([-40, (frame_y/2)-neutrik_panel_thickness, frame_bottom_bevel_height/2])
			rotate([90, 0, 0]) neutrik_d_mount();
		translate([-40, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([40, (frame_y/2)-neutrik_panel_thickness, frame_bottom_bevel_height/2])
			rotate([90, 0, 0]) neutrik_d_mount();
		translate([40, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
	}
}

middle_frame();
