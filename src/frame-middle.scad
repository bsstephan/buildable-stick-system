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
		translate([0, 0, -top_plate_z/2]) frame_connection_holes();
		translate([0, 0, -top_plate_z/2]) mirror([1, 0, 0]) frame_connection_holes();

		// cable routing holes
		translate([0, 0, -top_plate_z/2]) frame_cable_routing_hole();
		translate([0, 0, -top_plate_z/2]) mirror([1, 0, 0]) frame_cable_routing_hole();

		// neutrik mounts for connector, switches
		translate([0, (frame_y/2)-neutrik_panel_thickness, 0]) rotate([90, 0, 0]) neutrik_d_mount();
		translate([-40, (frame_y/2)-neutrik_panel_thickness, 0]) rotate([90, 0, 0]) neutrik_d_mount();
		translate([40, (frame_y/2)-neutrik_panel_thickness, 0]) rotate([90, 0, 0]) neutrik_d_mount();
	}
}

middle_frame();
