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

module namco_noir_plus_two_panel() {
	difference() {
		translate([top_plate_x/2, top_plate_y/2, 0]) topplate();
		noir_plus_one();
		translate([32.94-3.47-3.47, -78+7.37+4.49, 0]) noir_button_p1();
	}
}

namco_noir_plus_two_panel();
