/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

module m4_hole() {
	cylinder(r=m4_bolt_radius, h=100, $fn=50, center=true);
}

module m4_hole_countersink() {
	cylinder(r1=m4_bolt_radius, r2=m4_bolt_countersink_radius, h=3.2, $fn=50, center=true);
}

module m6_hole() {
	cylinder(r=m6_bolt_radius, h=100, $fn=50, center=true);
}

module panel_holes() {
	// holes for mount bolts
	translate([panel_to_frame_point_x, panel_to_frame_point_y, 0]) m4_hole();
	translate([panel_to_frame_point_x, -panel_to_frame_point_y, 0]) m4_hole();
	translate([-panel_to_frame_point_x, panel_to_frame_point_y, 0]) m4_hole();
	translate([-panel_to_frame_point_x, -panel_to_frame_point_y, 0]) m4_hole();
	// holes for mount bolt countersinks
	translate([panel_to_frame_point_x, panel_to_frame_point_y, 2]) m4_hole_countersink();
	translate([panel_to_frame_point_x, -panel_to_frame_point_y, 2]) m4_hole_countersink();
	translate([-panel_to_frame_point_x, panel_to_frame_point_y, 2]) m4_hole_countersink();
	translate([-panel_to_frame_point_x, -panel_to_frame_point_y, 2]) m4_hole_countersink();
}

// button hole, with extra wide bits for various uses (cutting out space
// for snap-ins, etc.
module button_24mm_hole() {
	cylinder(r=small_button_radius, h=100, $fn=50, center=true);
	// carve out space for snap-ins and screw-in nuts
	// translation is to leave 3mm thickness in the plate without recentering anything
	translate([0, 0, -25]) cylinder(r=small_button_radius+button_radius_connector_space, h=49, $fn=50, center=true);
	// space for decorative button surround stuff
	translate([0, 0, 50]) cylinder(r=small_button_radius*decorative_radius_scale, h=20, $fn=50, center=true);
	translate([0, 0, 70]) cylinder(r=small_button_radius*jumbo_decorative_radius_scale, h=20, $fn=50, center=true);
}

// button hole, with extra wide bits for various uses (cutting out space
// for snap-ins, etc.
module button_30mm_hole() {
	cylinder(r=big_button_radius, h=100, $fn=50, center=true);
	// carve out space for snap-ins and screw-in nuts
	// translation is to leave 3mm thickness in the plate without recentering anything
	translate([0, 0, -25]) cylinder(r=big_button_radius+button_radius_connector_space, h=49, $fn=50, center=true);
	// space for decorative button surround stuff
	translate([0, 0, 50]) cylinder(r=big_button_radius*decorative_radius_scale, h=20, $fn=50, center=true);
	translate([0, 0, 70]) cylinder(r=big_button_radius*jumbo_decorative_radius_scale, h=20, $fn=50, center=true);
}

module frame_hex_bolt_hole() {
	scale([1, 1, 2]) cylinder(r=m4_bolt_hex_exterior_radius, h=frame_z, $fn=6, center=true);
}

module frame_interchange_hole() {
	cylinder(r=37, h=50, $fn=50, center=true);
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

// space for a neutrik D mount or 24mm button --- Z is meant to leave some lip now that frames
// are primarily printed on their side
module frame_cutout() {
	cube([35, 8, frame_z-(panel_z*3)], center=true);
}

// bank of three 24mm buttons, commonly on a frame face
module aux_control_three_button_cluster() {
	translate([-37, 0, 0]) button_24mm_hole();
	translate([0, 0, 0]) button_24mm_hole();
	translate([37, 0, 0]) button_24mm_hole();
}

module aux_control_three_button_tight_cluster() {
	translate([-32, 0, 0]) button_24mm_hole();
	translate([0, 0, 0]) button_24mm_hole();
	translate([32, 0, 0]) button_24mm_hole();
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
}

module levermountcountersinks() {
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

module base_panel() {
	cube([panel_x, panel_y, panel_z], center=true);
}

module panel() {
	difference() {
		base_panel();
		panel_holes();
	}
}

module overhang_plate() {
	top_points = [
		// top bevel
		[(overhang_panel_x/2)-(overhang_panel_bevel_height*2),
		 (overhang_panel_y/2)-(overhang_panel_bevel_height*2),
		 panel_z/2-overhang_panel_bevel_height/2],
		[-(overhang_panel_x/2)+(overhang_panel_bevel_height*2),
		 (overhang_panel_y/2)-(overhang_panel_bevel_height*2),
		 panel_z/2-overhang_panel_bevel_height/2],
		[(overhang_panel_x/2)-(overhang_panel_bevel_height*2),
		 -(overhang_panel_y/2)+(overhang_panel_bevel_height*2),
		 panel_z/2-overhang_panel_bevel_height/2],
		[-(overhang_panel_x/2)+(overhang_panel_bevel_height*2),
		 -(overhang_panel_y/2)+(overhang_panel_bevel_height*2),
		 panel_z/2-overhang_panel_bevel_height/2],
	];
	hull() {
		for (p = top_points) {
			translate(p) cylinder(r=overhang_panel_bevel_height, h=overhang_panel_bevel_height, center=true);
		}
		translate([0, 0, -overhang_panel_bevel_height])
			cube([overhang_panel_x, overhang_panel_y, panel_z-overhang_panel_bevel_height*2], center=true);
	}
}

// this takes the base_panel and makes it a small frame, putting a larger top plate
module base_panel_with_raised_overhang() {
	// make a frame out of the top plate (and keep the main plate on the center plane)
	translate([0, 0, -5]) difference() {
		base_panel();
		cube([panel_x-(panel_support_width*2), panel_y-(panel_support_width*2), panel_z], center=true);
	}
	translate([panel_to_frame_point_x, panel_to_frame_point_y, -2.5]) resize([0, 0, 10])
		frame_mount_column();
	translate([-(panel_to_frame_point_x), panel_to_frame_point_y, -2.5]) resize([0, 0, 10])
		rotate([0, 0, 90]) frame_mount_column();
	translate([panel_to_frame_point_x, -(panel_to_frame_point_y), -2.5]) resize([0, 0, 10])
		rotate([0, 0, 270]) frame_mount_column();
	translate([-(panel_to_frame_point_x), -(panel_to_frame_point_y), -2.5]) resize([0, 0, 10])
		rotate([0, 0, 180]) frame_mount_column();
	overhang_plate();
}

module panel_with_raised_overhang() {
	difference() {
		base_panel_with_raised_overhang();
		panel_holes();
	}
}

module frame_solid() {
	difference() {
		top_points = [
			// top bevel
			[(frame_x/2)-(frame_bevel_height*2),
			 (frame_y/2)-(frame_bevel_height*2),
			 frame_z/2-frame_bevel_height/2],
			[-(frame_x/2)+(frame_bevel_height*2),
			 (frame_y/2)-(frame_bevel_height*2),
			 frame_z/2-frame_bevel_height/2],
			[(frame_x/2)-(frame_bevel_height*2),
			 -(frame_y/2)+(frame_bevel_height*2),
			 frame_z/2-frame_bevel_height/2],
			[-(frame_x/2)+(frame_bevel_height*2),
			 -(frame_y/2)+(frame_bevel_height*2),
			 frame_z/2-frame_bevel_height/2],
		];
		base_points = [
			// majority of shape
			[(frame_x/2)-frame_bevel_height, (frame_y/2)-frame_bevel_height, 0],
			[-(frame_x/2)+frame_bevel_height, (frame_y/2)-frame_bevel_height, 0],
			[(frame_x/2)-frame_bevel_height, -(frame_y/2)+frame_bevel_height, 0],
			[-(frame_x/2)+frame_bevel_height, -(frame_y/2)+frame_bevel_height, 0],
		];
		bottom_points = [
			// bottom bevel
			[(frame_x/2)-(frame_bevel_height*2),
			 (frame_y/2)-(frame_bevel_height*2),
			 -frame_z/2+frame_bevel_height/2],
			[-(frame_x/2)+(frame_bevel_height*2),
			 (frame_y/2)-(frame_bevel_height*2),
			 -frame_z/2+frame_bevel_height/2],
			[(frame_x/2)-(frame_bevel_height*2),
			 -(frame_y/2)+(frame_bevel_height*2),
			 -frame_z/2+frame_bevel_height/2],
			[-(frame_x/2)+(frame_bevel_height*2),
			 -(frame_y/2)+(frame_bevel_height*2),
			 -frame_z/2+frame_bevel_height/2],
		];
		hull() {
			for (p = top_points) {
				translate(p) cylinder(r=2, h=frame_bevel_height, center=true);
			}
			for (p = base_points) {
				translate(p) cylinder(r=2, h=frame_z-(frame_bevel_height*2), center=true);
			}
			for (p = bottom_points) {
				translate(p) cylinder(r=2, h=frame_bevel_height, center=true);
			}
		}
	}
}

module frame_box() {
	difference() {
		frame_solid();
		// cut out the middle to make it a box
		cube([panel_x-(panel_support_width*2), panel_y-(panel_support_width*2), frame_z+5], center=true);
	}
}

module frame_mount_column() {
	cube([frame_mount_column_width, frame_mount_column_width, frame_z], center=true);
	// add some corners back to do a lame chamfer
	linear_extrude(height=frame_z, center=true)
		polygon([
			[frame_mount_column_width/2, frame_mount_column_width/2],
			[-frame_mount_column_width, frame_mount_column_width/2],
			[frame_mount_column_width/2, -frame_mount_column_width]
		]);
}

module side_chopper() {
	translate([(frame_x-frame_wall)/2+panel_overhang_amount, 0, 0])
		cube([frame_wall+panel_overhang_amount*2, overhang_panel_y, frame_z], center=true);
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
	// frame_y/12 is a hack for "kinda a bit above the center point"
	translate([frame_x/2, frame_y/12+1, 25]) rotate([0, 90, 0]) frame_interchange_hole();
}

module base_frame() {
	frame_box();
	translate([panel_to_frame_point_x, panel_to_frame_point_y, 0]) frame_mount_column();
	translate([-panel_to_frame_point_x, panel_to_frame_point_y, 0]) rotate([0, 0, 90]) frame_mount_column();
	translate([-panel_to_frame_point_x, -(panel_to_frame_point_y), 0]) rotate([0, 0, 180])  frame_mount_column();
	translate([panel_to_frame_point_x, -(panel_to_frame_point_y), 0]) rotate([0, 0, 270])  frame_mount_column();
}

module frame() {
	difference() {
		base_frame();
		translate([0, 0, frame_z/2]) scale([1, 1, 2]) base_panel();
		translate([0, 0, -frame_z/2]) scale([1, 1, 2]) base_panel();;
		translate([panel_to_frame_point_x, panel_to_frame_point_y, 0]) frame_hex_bolt_hole();
		translate([-panel_to_frame_point_x, panel_to_frame_point_y, 0]) frame_hex_bolt_hole();
		translate([panel_to_frame_point_x, -panel_to_frame_point_y, 0]) frame_hex_bolt_hole();
		translate([-panel_to_frame_point_x, -panel_to_frame_point_y, 0]) frame_hex_bolt_hole();
	}
}

/* MISC SHAPES --- for cutting out decorative panels, frame wall windows, etc. */

// for cutting out slashes from the frame outer wall
module slash_cutout() {
	polyhedron([
		[slash_inner_displacement/2, -frame_wall/2, -slash_height/2],
		[(slash_inner_displacement/2+slash_width), -frame_wall/2, -slash_height/2],
		[(slash_inner_displacement/2+slash_width), frame_wall/2, -slash_height/2],
		[slash_inner_displacement/2, frame_wall/2, -slash_height/2],
		[-(slash_inner_displacement/2+slash_width), -frame_wall/2, slash_height/2],
		[-slash_inner_displacement/2, -frame_wall/2, slash_height/2],
		[-slash_inner_displacement/2, frame_wall/2, slash_height/2],
		[-(slash_inner_displacement/2+slash_width), frame_wall/2, slash_height/2]
	], [[0, 1, 2, 3], [4, 5, 1, 0], [7, 6, 5, 4], [5, 6, 2, 1], [6, 7, 3, 2], [7, 4, 0, 3]]);
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
	translate([(panel_x/2)-sega_2p_column_1_left_panel_edge_offset, (-panel_y/2)+62, 0]) button_30mm_hole();
}

module dir_arc_30mm_finger_buttons() {
	translate([0, dir_arc_30mm_row_2_offset, 0]) dir_arc_30mm_thumb_button();
	translate([-dir_arc_30mm_column_2_offset, dir_arc_30mm_row_3_offset, 0]) dir_arc_30mm_thumb_button();
	translate([-dir_arc_30mm_column_3_offset, dir_arc_30mm_row_3_offset, 0]) dir_arc_30mm_thumb_button();
}

module dir_arc_w_30mm() {
	dir_arc_30mm_thumb_button();
	dir_arc_30mm_finger_buttons();
	translate([-26.8, dir_arc_w_30mm_row_4_offset, 0]) dir_arc_30mm_thumb_button();
}

module dir_arc_w_30mm_plus_one() {
	dir_arc_w_30mm();
	translate([-dir_arc_30mm_column_3_offset-33.8, dir_arc_30mm_row_2_offset, 0]) dir_arc_30mm_thumb_button();
}

// Namco Noir (right hand)

module noir_button_p1() {
	translate([-panel_x/2, -panel_y/2, 0]) translate([35, 140, 0]) button_30mm_hole();
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
	translate([-panel_x/2, -panel_y/2, 0]) translate([sega_2p_column_1_left_panel_edge_offset, 140, 0])
		button_30mm_hole();
}

module sega_2p_6_button() {
	// via slagcoin
	sega_2p_p1();
	translate([sega_2p_column_2_offset, 11+9, 0]) sega_2p_p1();
	translate([sega_2p_column_3_offset, 11+9, 0]) sega_2p_p1();
	translate([0, -19-9-11, 0]) sega_2p_p1();
	translate([sega_2p_column_2_offset, -19, 0]) sega_2p_p1();
	translate([sega_2p_column_3_offset, -19, 0]) sega_2p_p1();
}

module sega_2p() {
	sega_2p_6_button();
	translate([sega_2p_column_4_offset, 11, 0]) sega_2p_p1();
	translate([sega_2p_column_4_offset, -19-9, 0]) sega_2p_p1();
}

module sega_2p_plus_one() {
	sega_2p();
	// just my guesstimate on this one
	translate([0, -19-9-11-19-9-11, 0]) sega_2p_p1();
}

module sega_2p_eleven() {
	sega_2p_plus_one();
	translate([sega_2p_column_5_offset, 0, 0]) sega_2p_p1();
	translate([sega_2p_column_5_offset, -19-9-11, 0]) sega_2p_p1();
}

module shiokenstar() {
	translate([-172, 32, 0]) dir_arc_24mm_directionals();
	sega_2p();
}
