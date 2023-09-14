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
use <top-panel-right-sega-2p-plus-one.scad>

module top_panel_right_sega_2p_plus_one_with_mount() {
	difference() {
		union() {
			top_panel_right_sega_2p_plus_one();
			translate([30, -50, -(top_plate_z/2) - 3]) pcb_mount();
		}
	}
}

top_panel_right_sega_2p_plus_one_with_mount();
