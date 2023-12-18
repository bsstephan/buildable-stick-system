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
use <top-panel-right-sega-2p-plus-one-plus-control-with-mount.scad>

module top_panel_right_sega_2p_plus_one_plus_control_with_mount_with_oled() {
	difference() {
		top_panel_right_sega_2p_plus_one_plus_control_with_mount();
		translate([75, 77.5, 0]) oled_ssd1306_mount_cutout();
	}
	translate([75, 77.5, 0.5]) oled_ssd1306_mount();
}

top_panel_right_sega_2p_plus_one_plus_control_with_mount_with_oled();
