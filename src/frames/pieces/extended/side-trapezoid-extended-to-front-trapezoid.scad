/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/complete/left-frame.scad>
use <frames/pieces/box/side.scad>
use <front-or-back-trapezoid.scad>

module side_and_bottom_frame_piece_wall() {
	// get a slice of the pieces, to use it in extruding
	// this doesn't use the side_frame_piece because of the 45 degree angle geometry
	// not creating a clean thing to cut, so we just take the whole wall and use that
	projection(cut=true) rotate([0, 90, 0]) translate([frame_x/2-frame_wall-(frame_bevel_height/2), 0, 0])
		left_frame();
	projection(cut=true) translate([0, -frame_y/2+frame_wall, 0]) rotate([90, 90, 0]) bottom_piece_extension();
}

module side_and_bottom_frame_piece_extension() {
	// combine the original with a shrunken piece to "pull" the wall out
	hull() {
		linear_extrude(height=frame_extension_y) scale([0.5, 0.90, 1]) side_and_bottom_frame_piece_wall();
		linear_extrude(height=frame_bevel_height) side_and_bottom_frame_piece_wall();
	}
}

module side_trapezoid_extended_to_front_frame_piece() {
	difference() {
		side_box_frame_piece();
		// chop off the old edge which is getting replaced with the extension
		translate([-frame_x/2+frame_bevel_height/2, 0, 0]) cube([frame_bevel_height, frame_y, frame_z], center=true);
	}
	translate([-frame_x/2+frame_bevel_height*2, 0, 0]) rotate([0, -90, 0]) side_and_bottom_frame_piece_extension();
}

side_trapezoid_extended_to_front_frame_piece();
