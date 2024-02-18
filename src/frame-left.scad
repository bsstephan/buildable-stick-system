/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module base_left_frame() {
	difference() {
		frame();
		// chop the right edge off
		side_chopper();
	}
}

module left_frame() {
	difference() {
		base_left_frame();
		// connection holes to other frames
		frame_connection_holes();

		// cable routing hole
		frame_cable_routing_hole();

		// aux button holes
		translate([-35, 101.5, panel_z/2]) rotate([270, 0, 0]) aux_control_three_button_cluster();
		translate([-35, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([-72, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([2, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();

		// neutrix button hole
		translate([frame_center_to_neutrik, (frame_y/2)-neutrik_panel_thickness, panel_z/2])
			rotate([90, 0, 0]) neutrik_d_mount();
		translate([frame_center_to_neutrik, (frame_y/2)-neutrik_panel_thickness-4, 0])
			frame_cutout();
	}
}

left_frame();
