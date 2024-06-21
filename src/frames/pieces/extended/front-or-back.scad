/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back-clean-for-extended-side.scad>

module clean_front_or_back() {
	difference() {
		front_or_back_box_frame_piece_for_extended_side();
		// chop off the lip we left on the basic piece
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
	};
}

module bottom_piece_wall() {
	// get a slice of the piece (before the bevel), to use it in extruding
	projection(cut=true) rotate([-90, 0, 0]) translate([0, frame_y/2-(frame_wall-frame_bevel_height)*3/2, 0])
		clean_front_or_back();
}

module bottom_piece_extension() {
	// combine the original with a shrunken piece to "pull" the wall out
	hull() {
		linear_extrude(height=frame_extension_y) scale([1, 0.5, 1]) bottom_piece_wall();
		linear_extrude(height=(frame_wall-frame_bevel_height)) bottom_piece_wall();
	}
}

module extended_front_or_back_frame_piece() {
	clean_front_or_back();
	translate([0, -frame_y/2+frame_wall, 0]) rotate([90, 0, 0]) bottom_piece_extension();
}

extended_front_or_back_frame_piece();
