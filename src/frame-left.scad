/* Copyright Brian Stephan 2023
 *
 * This file is part of bullet-system-stick.
 *
 * bullet-system-stick is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 *
 * bullet-system-stick is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * bullet-system-stick. If not, see <https://www.gnu.org/licenses/>.
 */

include <components.scad>

module base_left_frame() {
	difference() {
		frame();
		// chop the right edge off
		frame_side_chopper();
	}
}

module left_frame() {
	difference() {
		base_left_frame();
		// connection holes to other frames
		translate([0, 0, -top_plate_z/2]) frame_connection_holes();

		// cable routing hole
		translate([0, 0, -top_plate_z/2]) frame_cable_routing_hole();

		// aux button holes
		translate([0, 100, 0]) rotate([90, 0, 0]) button_24mm_hole();
		translate([-40, 100, 0]) rotate([90, 0, 0]) button_24mm_hole();
		translate([40, 100, 0]) rotate([90, 0, 0]) button_24mm_hole();
	}
}

left_frame();
