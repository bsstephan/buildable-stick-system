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

module left_frame() {
	difference() {
		frame();
		// chop the right edge off
		translate([frame_x/2, 0, 0]) cube([10.001, 2*(frame_y+top_plate_y), 2*(frame_z+top_plate_z)], center=true);
	}
}

difference() {
	left_frame();
	// connection holes to other frames
	frame_connection_holes();

	// cable routing hole
	frame_cable_routing_hole();
}
