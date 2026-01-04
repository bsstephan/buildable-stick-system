/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/complete/left-frame.scad>
use <side.scad>

piece_width = panel_support_width+frame_wall+frame_mount_column_width;
module front_or_back_frame_piece() {
	intersection() {
		left_frame();
		difference() {
			// include the whole bottom wall (including mount columns)
			translate([0, -(frame_y/2)+(piece_width/2), 0])
				cube([frame_piece_x_x, piece_width, frame_z], center=true);
			// ...minus a slot for the combining piece to go into
			cube([frame_x, frame_y-(panel_support_width+frame_wall)*2, inner_frame_z/3], center=true);
		}
	}
}

// there's something with the print quality/slicing where a couple layers
// around the hex hole get fat in the walls, making this not flush with a
// sibling piece. this removal makes it so the pieces don't touch
// HOWEVER, the side piece uses front_or_back_frame_piece() as a difference,
// so if we removed the little chop from that piece, it'd make the
// side_frame_piece() bigger, defeating the purpose, so what we'll actually
// print is this one and there'll be a little gap in between as desired
//
// front/back pieces that build on this shape should inherit from clean_edge_
module clean_edge_front_or_back_frame_piece() {
	difference() {
		front_or_back_frame_piece();
		translate([panel_x/2, -(panel_y/2-15), 0]) cube([5, 30, inner_frame_z*2], center=true);
		translate([-panel_x/2, -(panel_y/2-15), 0]) cube([5, 30, inner_frame_z*2], center=true);
	}
}

clean_edge_front_or_back_frame_piece();
