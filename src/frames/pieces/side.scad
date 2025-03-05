/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/complete/left-frame.scad>
use <front-or-back.scad>

module side_frame_piece() {
	piece_width = panel_support_width+frame_wall+frame_mount_column_width;
	difference() {
		intersection() {
			left_frame();
			// include the whole left wall (including mount columns)
			translate([-(frame_x/2)+(piece_width/2), 0, 0])
				cube([piece_width, frame_piece_y_y, frame_z], center=true);
		}
		// minus the top and bottom
		front_or_back_frame_piece();
		rotate([180, 0, 0]) front_or_back_frame_piece();
	}
}

side_frame_piece();
