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

module lsx_nobi_dustwasher() {
	difference() {
		cylinder(r=lever_plate_hole*decorative_radius_scale, h=2, $fn=50, center=true);
		// 5.25 = 5 (diameter of shaft is 10mm) + .25 to let it take an angle
		cylinder(r=5.25+hole_tolerance, h=2.1, $fn=50, center=true);
	}
}

lsx_nobi_dustwasher();
