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

module spdt_neutrik_d_plate() {
	difference() {
		cube([30, 35, 2], center=true);
		translate([9.5, 12, 0]) neutrik_d_screw_hole();
		translate([-9.5, -12, 0]) neutrik_d_screw_hole();
		cylinder(r=10+hole_tolerance, h=5, $fn=50, center=true);
		cube([2.2, 22, 5], center=true);
	}
}

spdt_neutrik_d_plate();
