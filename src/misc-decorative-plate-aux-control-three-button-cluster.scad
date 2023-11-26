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
use <misc-neutrik-d-plate.scad>

module aux_control_three_button_cluster_decorative_plate() {
	difference() {
		hull() {
			translate([-50, 0, 0]) neutrik_d_plate();
			translate([50, 0, 0]) neutrik_d_plate();
		}
		translate([0, 0, -10]) aux_control_three_button_cluster();
	}
}

aux_control_three_button_cluster_decorative_plate();
