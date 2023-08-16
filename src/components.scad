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

/* QUASI-CONSTANTS */

// adjustments
hole_tolerance = 0.25;

// M4
m4_bolt_radius = 2 + hole_tolerance;
m4_bolt_countersink_radius = 6 + hole_tolerance;
m4_bolt_hex_exterior = 3.5 + hole_tolerance;

// 24mm button
small_button_radius = 12 + hole_tolerance;

/* PARTS */

module m4_hole() {
	cylinder(r=m4_bolt_radius, h=100, $fn=50, center=true);
}

module m4_hole_countersink() {
	cylinder(r1=m4_bolt_radius, r2=m4_bolt_countersink_radius, h=3.1, $fn=50, center=true);
}

module button_24mm_hole() {
	cylinder(r=small_button_radius, h=100, $fn=50, center=true);
}

/* PIECES */

module levermountbase() {
	difference() {
		// base plate
		cube([53,95,3], center=true);
		// joystick hole
		cylinder(r=21, h=3.1, $fn=50, center=true);
	}
}

// see https://www.slagcoin.com/joystick/mounting_layering.html
// should work with JLF, JLW, LS-32, LS-33, LS-40, LS-55, LS-56
module levermountholes() {
	// joystick hole
	cylinder(r=12, h=5.1, $fn=50, center=true);
	// holes for joystick bolts
	translate([20, 42.5, 0])
		m4_hole();
	translate([20, -42.5, 0])
		m4_hole();
	translate([-20, 42.5, 0])
		m4_hole();
	translate([-20, -42.5, 0])
		m4_hole();
	// holes for joystick bolt countersinks
	translate([20, 42.5, 2])
		m4_hole_countersink();
	translate([20, -42.5, 2])
		m4_hole_countersink();
	translate([-20, 42.5, 2])
		m4_hole_countersink();
	translate([-20, -42.5, 2])
		m4_hole_countersink();
}

module base_topplate() {
	cube([175,200,5], center=true);
}

module topplate() {
	difference() {
		base_topplate();
		// holes for mount bolts
		translate([77.5, 90, 0])
			m4_hole();
		translate([77.5, -90, 0])
			m4_hole();
		translate([-77.5, 90, 0])
			m4_hole();
		translate([-77.5, -90, 0])
			m4_hole();
		// holes for mount bolt countersinks
		translate([77.5, 90, 2])
			m4_hole_countersink();
		translate([77.5, -90, 2])
			m4_hole_countersink();
		translate([-77.5, 90, 2])
			m4_hole_countersink();
		translate([-77.5, -90, 2])
			m4_hole_countersink();
	}
}
