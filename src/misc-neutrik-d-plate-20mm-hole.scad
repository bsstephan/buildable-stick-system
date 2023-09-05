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

module neutrik_d_plate_20mm() {
	difference() {
		cube([30, 35, 2], center=true);
		translate([9.5, 12, 0]) neutrik_d_screw_hole();
		translate([-9.5, -12, 0]) neutrik_d_screw_hole();
		cylinder(r=10+hole_tolerance, h=5, $fn=50, center=true);
		cube([2.2, 22, 5], center=true);
	}
}

neutrik_d_plate_20mm();
