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

include <roundedcube.scad>

module m4_hole() {
	cylinder(r=m4_bolt_radius, h=100, $fn=50, center=true);
}

module m4_hole_countersink() {
	cylinder(r1=m4_bolt_radius, r2=m4_bolt_countersink_radius, h=3.2, $fn=50, center=true);
}

module top_plate_holes() {
	// holes for mount bolts
	translate([plate_to_frame_point_x, plate_to_frame_point_y, 0]) m4_hole();
	translate([plate_to_frame_point_x, -plate_to_frame_point_y, 0]) m4_hole();
	translate([-plate_to_frame_point_x, plate_to_frame_point_y, 0]) m4_hole();
	translate([-plate_to_frame_point_x, -plate_to_frame_point_y, 0]) m4_hole();
	// holes for mount bolt countersinks
	translate([plate_to_frame_point_x, plate_to_frame_point_y, 2]) m4_hole_countersink();
	translate([plate_to_frame_point_x, -plate_to_frame_point_y, 2]) m4_hole_countersink();
	translate([-plate_to_frame_point_x, plate_to_frame_point_y, 2]) m4_hole_countersink();
	translate([-plate_to_frame_point_x, -plate_to_frame_point_y, 2]) m4_hole_countersink();
}

// button hole, with extra wide bits for various uses (cutting out space
// for snap-ins, etc.
module button_24mm_hole() {
	cylinder(r=small_button_radius, h=100, $fn=50, center=true);
	// carve out space for snap-ins, leave 3mm
	// slagcoin has screw-in nut diameter at 29.5mm, so radius+6 to leave some space
	// translation is to leave 3mm thickness in the plate without recentering anything
	translate([0, 0, -25]) cylinder(r=small_button_radius+6, h=49, $fn=50, center=true);
	// space for decorative button surround stuff
	translate([0, 0, 50]) cylinder(r=small_button_radius*decorative_radius_scale, h=20, $fn=50, center=true);
	translate([0, 0, 70]) cylinder(r=small_button_radius*jumbo_decorative_radius_scale, h=20, $fn=50, center=true);
}

// button hole, with extra wide bits for various uses (cutting out space
// for snap-ins, etc.
module button_30mm_hole() {
	cylinder(r=big_button_radius, h=100, $fn=50, center=true);
	// carve out space for snap-ins, leave 3mm
	// slagcoin has screw-in nut diameter at 36mm, so radius+6 to leave some space
	// translation is to leave 3mm thickness in the plate without recentering anything
	translate([0, 0, -25]) cylinder(r=big_button_radius+6, h=49, $fn=50, center=true);
	// space for decorative button surround stuff
	translate([0, 0, 50]) cylinder(r=big_button_radius*decorative_radius_scale, h=20, $fn=50, center=true);
	translate([0, 0, 70]) cylinder(r=big_button_radius*jumbo_decorative_radius_scale, h=20, $fn=50, center=true);
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

module rocker_20mm_mount() {
	cylinder(r=10+hole_tolerance, h=5, $fn=50, center=true);
	cube([2.2, 22, 5], center=true);
	translate([9.5, 12, 0]) neutrik_d_screw_hole();
	translate([-9.5, -12, 0]) neutrik_d_screw_hole();
}

// space for a neutrik D mount or 24mm button - Z is to cut the whole inside without affecting panel lip
module frame_cutout() {
	cube([36.5, 8, frame_z-(top_plate_z*2)], center=true);
}

// bank of three 24mm buttons, commonly on a frame face
module aux_control_three_button_cluster() {
	translate([-40, 0, 0]) button_24mm_hole();
	translate([0, 0, 0]) button_24mm_hole();
	translate([40, 0, 0]) button_24mm_hole();
}

module m2_mount_post() {
	difference() {
		cylinder(r=m2_screw_selftap_radius*2.25, h=3, $fn=6, center=true);
		cylinder(r=m2_screw_selftap_radius, h=3*2, $fn=50, center=true);
	}
}

module oled_ssd1306_mount() {
	translate([11.5, 12, 0]) m2_mount_post();
	translate([11.5, -12, 0]) m2_mount_post();
	translate([-11.5, 12, 0]) m2_mount_post();
	translate([-11.5, -12, 0]) m2_mount_post();
}

module oled_ssd1306_mount_cutout() {
	translate([0, 1.9, 0]) cube([25, 14, 5], center=true);
	translate([0, 0, -1.0]) cube([35, 35, 4], center=true);
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
	cylinder(r=lever_plate_hole, h=5.1, $fn=50, center=true);
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

module overhang_plate() {
	roundedcube([overhang_top_plate_x, overhang_top_plate_y, top_plate_z], center=true, radius=1);
}

// this takes the base_topplate and makes it a small frame, putting a larger top plate
module base_top_plate_with_raised_overhang() {
	// make a frame out of the top plate (and keep the main plate on the center plane)
	translate([0, 0, -5]) difference() {
		base_topplate();
		cube([top_plate_x-(panel_support_width*2), top_plate_y-(panel_support_width*2), top_plate_z*2], center=true);
	}
	translate([plate_to_frame_point_x, plate_to_frame_point_y, -2.5]) resize([0, 0, 10]) frame_mount_column();
	translate([-(plate_to_frame_point_x), plate_to_frame_point_y, -2.5]) resize([0, 0, 10]) frame_mount_column();
	translate([plate_to_frame_point_x, -(plate_to_frame_point_y), -2.5]) resize([0, 0, 10]) frame_mount_column();
	translate([-(plate_to_frame_point_x), -(plate_to_frame_point_y), -2.5]) resize([0, 0, 10]) frame_mount_column();
	overhang_plate();
}

module topplate() {
	difference() {
		base_topplate();
		top_plate_holes();
	}
}

module bottom_plate_with_overhang() {
	difference() {
		rotate([180, 0, 0]) base_top_plate_with_raised_overhang();
		rotate([180, 0, 0]) top_plate_holes();
	}
}

module top_plate_with_raised_overhang() {
	difference() {
		base_top_plate_with_raised_overhang();
		top_plate_holes();
	}
}

module frame_box() {
	difference() {
		roundedcube([frame_x, frame_y, frame_z], center=true, radius=3);
		// cut out the middle to make it a box
		cube([top_plate_x-(panel_support_width*2), top_plate_y-(panel_support_width*2), frame_z+5], center=true);
	}
}

module frame_mount_column() {
	cube([20, 20, frame_z], center=true);
}

module side_chopper() {
	translate([(frame_x-frame_wall)/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
}

module frame_connection_holes() {
	translate([frame_x/2, (frame_y/4)+15, (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, (frame_y/4)+15, -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, (frame_y/4)-15, (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, (frame_y/4)-15, -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();

	translate([frame_x/2, -((frame_y/4)+15), (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, -((frame_y/4)+15), -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, -((frame_y/4)-15), (frame_z/4)]) rotate([0, 90, 0]) m4_hole();
	translate([frame_x/2, -((frame_y/4)-15), -(frame_z/4)]) rotate([0, 90, 0]) m4_hole();
}

module frame_cable_routing_hole() {
	translate([frame_x/2, 0, 0]) rotate([0, 90, 0]) frame_interchange_hole();
}

module base_frame() {
	frame_box();
	translate([plate_to_frame_point_x, plate_to_frame_point_y, 0]) frame_mount_column();
	translate([-plate_to_frame_point_x, plate_to_frame_point_y, 0]) frame_mount_column();
	translate([plate_to_frame_point_x, -(plate_to_frame_point_y), 0]) frame_mount_column();
	translate([-plate_to_frame_point_x, -(plate_to_frame_point_y), 0]) frame_mount_column();
}

module frame() {
	difference() {
		base_frame();
		translate([0, 0, frame_z/2]) scale([1, 1, 2]) base_topplate();
		translate([0, 0, -frame_z/2]) scale([1, 1, 2]) base_topplate();
		translate([plate_to_frame_point_x, plate_to_frame_point_y, 0]) frame_hex_bolt_hole();
		translate([-plate_to_frame_point_x, plate_to_frame_point_y, 0]) frame_hex_bolt_hole();
		translate([plate_to_frame_point_x, -plate_to_frame_point_y, 0]) frame_hex_bolt_hole();
		translate([-plate_to_frame_point_x, -plate_to_frame_point_y, 0]) frame_hex_bolt_hole();
	}
}

/* LAYOUTS */

// Directional Arc (both hands)

module dir_arc_24mm_directionals() {
	button_24mm_hole();
	translate([29.5, 0, 0]) button_24mm_hole();
	translate([29.5+26.3, -12.9, 0]) button_24mm_hole();
	translate([29.5+26.3+15.5, -65.2, 0]) button_30mm_hole();
}

module dir_arc_24mm_6_button() {
	dir_arc_24mm_directionals();
	translate([29.5+26.3+27.8, 0, 0]) button_24mm_hole();
	translate([29.5+26.3+27.8+26.9, 10.9, 0]) button_24mm_hole();
	translate([29.5+26.3+27.8+26.9+29.6, 10.9, 0]) button_24mm_hole();
	translate([29.5+26.3+15.5+9.7, -29.4, 0]) button_24mm_hole();
	translate([29.5+26.3+27.8+26.9-1.7, 10.9-30.1, 0]) button_24mm_hole();
	translate([29.5+26.3+27.8+26.9+29.6-0.2, 10.9-30.1, 0]) button_24mm_hole();
}

module dir_arc_24mm_8_button() {
	dir_arc_24mm_6_button();
	translate([29.5+26.3+27.8+26.9+29.6+29.5, 7.1, 0]) button_24mm_hole();
	translate([29.5+26.3+27.8+26.9+29.6+29.5-0.3, -23.9, 0]) button_24mm_hole();
}

// 6 button plus the normal fourth column for 8 button actually on a third row
module dir_arc_24mm_8_button_compressed() {
	dir_arc_24mm_6_button();
	translate([29.5+26.3+27.8+2.6, 29.4, 0]) button_24mm_hole();
	translate([29.5+26.3+27.8+26.9+2.6, 40.3, 0]) button_24mm_hole();
}

module dir_arc_plus_w_24mm_8_button() {
	dir_arc_24mm_8_button();
	translate([36, 28, 0]) button_24mm_hole();
}

// Directional Arc (left hand)

module dir_arc_30mm_thumb_button() {
	// just my guesstimate on this one, but note that this is the same position as sega 2p (just mirrored)
	translate([(top_plate_x/2)-28.06, (-top_plate_y/2)+62, 0]) button_30mm_hole();
}

module dir_arc_30mm() {
	dir_arc_30mm_thumb_button();
	translate([0, 57.2, 0]) dir_arc_30mm_thumb_button();
	translate([-33.8, 57.2+12.9, 0]) dir_arc_30mm_thumb_button();
	translate([-33.8-34.8, 57.2+12.9, 0]) dir_arc_30mm_thumb_button();
}

module dir_arc_w_30mm() {
	dir_arc_30mm();
	translate([-26.8, 57.2+12.9+34.5, 0]) dir_arc_30mm_thumb_button();
}

module dir_arc_w_30mm_plus_one() {
	dir_arc_w_30mm();
	translate([-33.8-34.8-33.8, 57.2, 0]) dir_arc_30mm_thumb_button();
}

// Namco Noir (right hand)

module noir_button_p1() {
	translate([-top_plate_x/2, -top_plate_y/2, 0]) translate([35, 140, 0]) button_30mm_hole();
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

// Sega Astro City 2P (right hand)

module sega_2p_p1() {
	translate([-top_plate_x/2, -top_plate_y/2, 0]) translate([28.06, 140, 0]) button_30mm_hole();
}

module sega_2p_6_button() {
	// via slagcoin
	sega_2p_p1();
	translate([30.5, 11+9, 0]) sega_2p_p1();
	translate([30.5+36, 11+9, 0]) sega_2p_p1();
	translate([0, -19-9-11, 0]) sega_2p_p1();
	translate([30.5, -19, 0]) sega_2p_p1();
	translate([30.5+36, -19, 0]) sega_2p_p1();
}

module sega_2p() {
	sega_2p_6_button();
	translate([30.5+36+36, 11, 0]) sega_2p_p1();
	translate([30.5+36+36, -19-9, 0]) sega_2p_p1();
}

module sega_2p_plus_one() {
	sega_2p();
	// just my guesstimate on this one
	translate([0, -19-9-11-19-9-11, 0]) sega_2p_p1();
}
