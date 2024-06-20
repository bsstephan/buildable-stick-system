/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <top-or-bottom-clean-for-extended-side.scad>

module clean_top_or_bottom() {
	difference() {
		top_or_bottom_box_frame_piece_for_extended_side();
		// chop off the lip we left on the basic piece
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
	};
}

module bottom_piece_wall() {
	// get a slice of the piece (before the bevel), to use it in extruding
	projection(cut=true) rotate([-90, 0, 0]) translate([0, frame_y/2-(frame_wall-frame_bevel_height)*3/2, 0])
		clean_top_or_bottom();
}

module bottom_piece_extension() {
	// combine the original with a shrunken piece to "pull" the wall out
	hull() {
		linear_extrude(height=frame_extension_y) scale([1, 0.5, 1]) bottom_piece_wall();
		linear_extrude(height=(frame_wall-frame_bevel_height)) bottom_piece_wall();
	}
}

module extended_top_or_bottom_frame_piece() {
	clean_top_or_bottom();
	translate([0, -frame_y/2+frame_wall, 0]) rotate([90, 0, 0]) bottom_piece_extension();
}

extended_top_or_bottom_frame_piece();
