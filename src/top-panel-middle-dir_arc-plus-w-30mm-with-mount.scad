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
use <top-panel-middle-dir_arc-plus-w-30mm.scad>

module top_panel_middle_dir_arc_w_30mm_with_mount() {
	top_panel_middle_dir_arc_w_30mm();
	translate([-15, -40, -(top_plate_z/2) - 3]) rotate([0, 0, -45]) pcb_mount();
}

top_panel_middle_dir_arc_w_30mm_with_mount();
