/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frame-right.scad>

module top_right_frame_piece() {
	piece_width = panel_support_width+frame_wall+frame_mount_column_width;
	intersection() {
		right_frame();
		difference() {
			// include the whole top wall (including mount columns)
			translate([0, (frame_y/2)-(piece_width/2), 0]) cube([frame_x, piece_width, frame_z], center=true);
			// ...minus the frame wall (lip) on the left but leaving the very top lip
			translate([frame_x/2-frame_wall/2, 0, 0])
				cube([frame_wall, frame_y-(frame_wall*2), frame_z], center=true);
			// ...minus a slot for the combining piece to go into
			cube([frame_x, frame_y-(panel_support_width+frame_wall)*2, frame_z/4], center=true);
		}
	}
}

top_right_frame_piece();
