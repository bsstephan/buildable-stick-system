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

module dir_arc_24mm_6_button_panel() {
	difference() {
		top_plate_with_raised_overhang();
		translate([-71.5, -top_plate_y/2+122.5, 0]) dir_arc_24mm_6_button();
	}
}

dir_arc_24mm_6_button_panel();
