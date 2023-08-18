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

module base_middle_frame() {
	difference() {
		frame();
		// chop the left and right edge off
		frame_side_chopper();
		mirror([1, 0, 0]) frame_side_chopper();
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
		translate([0, 100, 0]) rotate([90, 0, 0]) neutrik_d_mount();
		translate([-40, 100, 0]) rotate([90, 0, 0]) neutrik_d_mount();
		translate([40, 100, 0]) rotate([90, 0, 0]) neutrik_d_mount();

		// max panel thickness per ethercon
		translate([0, 10, 10]) cube([120, 180, 60], center=true);
	}
}

middle_frame();
