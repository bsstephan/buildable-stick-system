/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module base_right_frame() {
	difference() {
		frame();
		// chop the left edge off
		mirror([1, 0, 0]) side_chopper();
	}
}

module right_frame() {
	difference() {
		base_right_frame();
		// connection holes to other frames
		mirror([1, 0, 0]) frame_connection_holes();

		// cable routing hole
		mirror([1, 0, 0]) frame_cable_routing_hole();

		// aux button holes
		translate([35, 101.5, 0]) rotate([270, 0, 0]) aux_control_three_button_cluster();
		translate([35, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([72, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([-2, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();

		// neutrix button hole
		translate([-frame_center_to_neutrik, (frame_y/2)-neutrik_panel_thickness, 0])
			rotate([90, 0, 0]) neutrik_d_mount();
		translate([-frame_center_to_neutrik, (frame_y/2)-neutrik_panel_thickness-4, 0])
			frame_cutout();
	}
}

right_frame();
