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

include <roundedcube.scad>

/* QUASI-CONSTANTS */

// adjustments
hole_tolerance = 0.15;

// M3
m3_screw_selftap_radius = 1.3;

// M4
m4_bolt_radius = 2 + hole_tolerance;
m4_bolt_countersink_radius = 6.1 + hole_tolerance;
m4_bolt_hex_exterior_radius = 3.6 + hole_tolerance;

// 24mm button
small_button_radius = 12 + hole_tolerance;

// 30mm button
big_button_radius = 15 + hole_tolerance;

// JLF mount dimensions
lever_mount_x = 53;
lever_mount_y = 95;
lever_mount_z = 2;

// case dimensions
frame_x = 183;
frame_y = 208;
frame_z = 45;			// reminder: inside (including mounts) is chopped by top_plate_z for plates
top_plate_x = 175;
top_plate_y = 200;
top_plate_z = 5;

// neutrik D screw holes
neutrik_d_screw_radius = 1.6 + hole_tolerance;
neutrik_d_radius = 12 + hole_tolerance;

/* PARTS */

module m4_hole() {
	cylinder(r=m4_bolt_radius, h=100, $fn=50, center=true);
}

module m4_hole_countersink() {
	cylinder(r1=m4_bolt_radius, r2=m4_bolt_countersink_radius, h=3.2, $fn=50, center=true);
}

module button_24mm_hole() {
	cylinder(r=small_button_radius, h=100, $fn=50, center=true);
}

module button_30mm_hole() {
	cylinder(r=big_button_radius, h=100, $fn=50, center=true);
}

module frame_hex_bolt_hole() {
	scale([1, 1, 2]) cylinder(r=m4_bolt_hex_exterior_radius, h=frame_z, $fn=6, center=true);
}

module frame_interchange_hole() {
	cylinder(r=15, h=50, $fn=50, center=true);
}

module neutrik_d_hole() {
	cylinder(r=neutrik_d_radius, h=100, $fn=50, center=true);
}

module neutrik_d_screw_hole() {
	cylinder(r=neutrik_d_screw_radius, h=100, $fn=50, center=true);
}

module neutrik_d_mount() {
	neutrik_d_hole();
	translate([9.5, 12, 0]) neutrik_d_screw_hole();
	translate([-9.5, -12, 0]) neutrik_d_screw_hole();
}

module m3_mount_post() {
	difference() {
		cylinder(r=m3_screw_selftap_radius*4, h=8, $fn=6, center=true);
		cylinder(r=m3_screw_selftap_radius, h=8*2, $fn=50, center=true);
	}
}

module pcb_mount() {
	translate([44, 18.5, 0]) m3_mount_post();
	translate([44, -18.5, 0]) m3_mount_post();
	translate([-44, 18.5, 0]) m3_mount_post();
	translate([-44, -18.5, 0]) m3_mount_post();
}

/* PIECES */

module levermountbase() {
	difference() {
		// base plate
		cube([lever_mount_x, lever_mount_y, lever_mount_z], center=true);
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
	cube([top_plate_x, top_plate_y, top_plate_z], center=true);
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

module frame_box() {
	difference() {
		roundedcube([frame_x, frame_y, frame_z], center=true, radius=3);
		cube([frame_x-26, frame_y-26, frame_z+5], center=true);
	}
}

module frame_mount_column() {
	cube([20, 20, frame_z], center=true);
}

module frame_side_chopper() {
	translate([frame_x/2, 0, 0]) cube([8, 2*(frame_y+top_plate_y), 2*(frame_z+top_plate_z)], center=true);
}

module frame_connection_holes() {
	translate([frame_x/2, (frame_y/4)+10, (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, (frame_y/4)+10, -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, (frame_y/4)-10, (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, (frame_y/4)-10, -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();

	translate([frame_x/2, -((frame_y/4)+10), (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, -((frame_y/4)+10), -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, -((frame_y/4)-10), (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, -((frame_y/4)-10), -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();
}

module frame_cable_routing_hole() {
	translate([frame_x/2, 0, 0]) rotate([0, 90, 0]) frame_interchange_hole();
}

module base_frame() {
	frame_box();
	translate([(top_plate_x/2)-10, (top_plate_y/2)-10, 0])
		frame_mount_column();
	translate([-((top_plate_x/2)-10), (top_plate_y/2)-10, 0])
		frame_mount_column();
	translate([(top_plate_x/2)-10, -((top_plate_y/2)-10), 0])
		frame_mount_column();
	translate([-((top_plate_x/2)-10), -((top_plate_y/2)-10), 0])
		frame_mount_column();
}

module frame() {
	difference() {
		base_frame();
		translate([0, 0, frame_z/2]) scale([1, 1, 2]) base_topplate();
		translate([(top_plate_x/2)-10, (top_plate_y/2)-10, 0])
			frame_hex_bolt_hole();
		translate([-((top_plate_x/2)-10), (top_plate_y/2)-10, 0])
			frame_hex_bolt_hole();
		translate([(top_plate_x/2)-10, -((top_plate_y/2)-10), 0])
			frame_hex_bolt_hole();
		translate([-((top_plate_x/2)-10), -((top_plate_y/2)-10), 0])
			frame_hex_bolt_hole();

		// thin up the mount point to accommodate snap-ins, ethercon adapter
		translate([0, 10, 10]) cube([120, 180, 60], center=true);
	}
}

/* LAYOUTS */

module dir_arc_30mm_button_l() {
	translate([68, 132, 0]) button_30mm_hole();
}

module dir_arc_w_30mm() {
	dir_arc_30mm_button_l();
	translate([35, 0, 0]) dir_arc_30mm_button_l();
	translate([35+33.5, -12.9, 0]) dir_arc_30mm_button_l();
	translate([35+7, 34.5, 0]) dir_arc_30mm_button_l();
	// just my guesstimate on this one, but note that this is the same position as sega 2p (just mirrored)
	translate([top_plate_x-33.06, 145-19-9-11-19-9-11, 0]) button_30mm_hole();
}

module dir_arc_w_30mm_plus_one() {
	dir_arc_w_30mm();
	translate([-33.5, -12.9, 0]) dir_arc_30mm_button_l();
}

module noir_button_p1() {
	translate([40, 145, 0]) button_30mm_hole();
}

module noir_plus_one() {
	// standard 8 (all relative to the first button) (via r/fightsticks)
	noir_button_p1();
	translate([32.94, 7.37+4.49, 0]) noir_button_p1();
	translate([32.94+34.54, 7.37, 0]) noir_button_p1();
	translate([32.94+34.54+33.02, -6.86, 0]) noir_button_p1();
	translate([-3.47, -6.86-19.64-4.32-7.62, 0]) noir_button_p1();
	translate([29.38, -6.86-19.64, 0]) noir_button_p1();
	translate([29.38+3.56+31.24, -6.86-19.64-4.32, 0]) noir_button_p1();
	translate([29.38+3.56+31.24+3.3+29.04, -6.86-19.64-4.32-7.62-6.93, 0]) noir_button_p1();

	// just my guesstimate on this one, but note that this is the same position as sega 2p
	translate([-3.47-3.47, -78, 0]) noir_button_p1();
}

module sega_2p_p1() {
	translate([33.06, 145, 0]) button_30mm_hole();
}

module sega_2p_plus_one() {
	// via slagcoin
	sega_2p_p1();
	translate([30.5, 11+9, 0]) sega_2p_p1();
	translate([30.5+36, 11+9, 0]) sega_2p_p1();
	translate([30.5+36+36, 11, 0]) sega_2p_p1();
	translate([0, -19-9-11, 0]) sega_2p_p1();
	translate([30.5, -19, 0]) sega_2p_p1();
	translate([30.5+36, -19, 0]) sega_2p_p1();
	translate([30.5+36+36, -19-9, 0]) sega_2p_p1();

	// just my guesstimate on this one, but note that this is the same position as sega 2p
	translate([0, -19-9-11-19-9-11, 0]) sega_2p_p1();
}
