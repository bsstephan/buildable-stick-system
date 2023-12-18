/* Copyright Brian Stephan 2023
 * SPDX-License-Identifier: GPL-3.0-or-later
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

module dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		union() {
			translate([-top_plate_x/2, 0, -65]) dir_arc_w_30mm();
			translate([top_plate_x/2, 0, -65]) sega_2p_plus_one();
		}
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([-top_plate_x/2, 0, -1]) dir_arc_w_30mm();
		translate([top_plate_x/2, 0, -1]) sega_2p_plus_one();
	}
}

dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate();
