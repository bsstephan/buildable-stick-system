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
		translate([-frame_x/2+2.5, 0, 0]) rotate([90, 0, 270]) aux_control_three_button_cluster();
		translate([(frame_x/2)-neutrik_panel_thickness-4, 0, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([(frame_x/2)-neutrik_panel_thickness-4, -40, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([(frame_x/2)-neutrik_panel_thickness-4, 40, 0]) rotate([0, 0, 90]) frame_cutout();

		translate([frame_x/2+2.5, 0, 0]) rotate([90, 0, 270]) aux_control_three_button_cluster();
		translate([-(frame_x/2)+neutrik_panel_thickness+4, 0, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([-(frame_x/2)+neutrik_panel_thickness+4, -40, 0]) rotate([0, 0, 90]) frame_cutout();
		translate([-(frame_x/2)+neutrik_panel_thickness+4, 40, 0]) rotate([0, 0, 90]) frame_cutout();
	}
}

solo_frame();
