/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frame-piece-top-or-bottom.scad>

module bottom_piece_wall() {
	// get a slice of the piece, to use it in extruding
	projection(cut=true) rotate([-90, 0, 0]) translate([0, frame_y/2-frame_bevel_height, 0])
		difference() {
			top_or_bottom_frame_piece();
			// chop off the lip we left on the basic piece
			translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
		};
}

module bottom_piece_extension() {
	// combine the original with a shrunken piece to "pull" the wall out
	hull() {
		linear_extrude(height=frame_extension_y) scale([1, 0.5, 1]) bottom_piece_wall();
		linear_extrude(height=frame_bevel_height) bottom_piece_wall();
	}
}

module extended_top_or_bottom_frame_piece() {
	difference() {
		top_or_bottom_frame_piece();
		// chop off the lip we left on the basic piece
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y+1, frame_z], center=true);
	}
	translate([0, -frame_y/2+frame_bevel_height, 0]) rotate([90, 0, 0]) bottom_piece_extension();
}

extended_top_or_bottom_frame_piece();
