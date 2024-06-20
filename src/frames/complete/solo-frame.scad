/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module solo_frame() {
	difference() {
		frame();

		// neutrik mounts for connector, switches
		translate([0, (frame_y/2)-2.5, 0]) rotate([90, 0, 0]) neutrik_d_mount();
		translate([0, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([-40, (frame_y/2)-2.5, 0]) rotate([90, 0, 0]) neutrik_d_mount();
		translate([-40, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([40, (frame_y/2)-2.5, 0]) rotate([90, 0, 0]) neutrik_d_mount();
		translate([40, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();

		// aux button holes
		translate([-frame_x/2+2.5, 0, 0]) rotate([90, 0, 270])
			aux_control_three_button_cluster();
		translate([(frame_x/2)-neutrik_panel_thickness-4, 0, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([(frame_x/2)-neutrik_panel_thickness-4, -37, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([(frame_x/2)-neutrik_panel_thickness-4, 37, 0]) rotate([0, 0, 90]) frame_cutout();

		translate([frame_x/2+2.5, 0, 0]) rotate([90, 0, 270])
			aux_control_three_button_cluster();
		translate([-(frame_x/2)+neutrik_panel_thickness+4, 0, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([-(frame_x/2)+neutrik_panel_thickness+4, -37, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([-(frame_x/2)+neutrik_panel_thickness+4, 37, 0]) rotate([0, 0, 90]) frame_cutout();
	}
}

solo_frame();
