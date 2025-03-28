/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>

module front_or_back_aux_and_neutrik_frame_piece() {
	difference() {
		front_or_back_frame_piece();

		// aux button holes
		translate([-35.25, -101.5, 0]) rotate([90, 0, 0]) aux_control_three_button_cluster();
		translate([-35.25, -(frame_y/2)+neutrik_panel_thickness+4, 0]) frame_cutout();
		translate([-72.25, -(frame_y/2)+neutrik_panel_thickness+4, 0]) frame_cutout();
		translate([2, -(frame_y/2)+neutrik_panel_thickness+4, 0]) frame_cutout();

		// neutrix button hole
		translate([frame_center_to_neutrik, -(frame_y/2)+neutrik_panel_thickness, 0])
			rotate([270, 0, 0]) neutrik_d_mount();
		translate([frame_center_to_neutrik, -(frame_y/2)+neutrik_panel_thickness+4, 0])
			frame_cutout();
	}
}

front_or_back_aux_and_neutrik_frame_piece();
