/* Copyright Brian Stephan 2023
 *
 * This file is part of the Buildable Stick System.
 *
 * The Buildable Stick System is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 *
 * The Buildable Stick System is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * the Buildable Stick System. If not, see <https://www.gnu.org/licenses/>.
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
		translate([30, 101.5, 0]) rotate([270, 0, 0]) aux_control_three_button_cluster();
		translate([30, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([70, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();
		translate([-10, (frame_y/2)-neutrik_panel_thickness-4, 0]) frame_cutout();

		// neutrix button hole
		translate([-frame_center_to_neutrik, (frame_y/2)-neutrik_panel_thickness, 0])
			rotate([90, 0, 0]) neutrik_d_mount();
		translate([-frame_center_to_neutrik, (frame_y/2)-neutrik_panel_thickness-4, 0])
			frame_cutout();
	}
}

right_frame();
