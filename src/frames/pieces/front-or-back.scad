/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/complete/left-frame.scad>
use <side.scad>

module front_or_back_frame_piece() {
	piece_width = panel_support_width+frame_wall+frame_mount_column_width;
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

front_or_back_frame_piece();
