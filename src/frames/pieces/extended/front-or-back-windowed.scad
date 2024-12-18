/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>
use <front-or-back-inner-wall.scad>

module front_or_back_window() {
	translate([0, -frame_y/2, 0])
		cube([frame_x-frame_mount_column_width*3.5, (frame_wall+panel_support_width)*2,
			frame_z-panel_z*3], center=true);
}

module windowed_front_or_back_frame_piece() {
	difference() {
		front_or_back_frame_piece();
		// subtract frame wall window
		front_or_back_window();
		// subtract the inner wall area that will be provided by the other piece
		front_or_back_inner_wall_frame_piece();
	}
}

module windowed_front_or_back_frame_piece_for_extended_side() {
	difference() {
		windowed_front_or_back_frame_piece();
		// ...minus the frame wall and lip on the left
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
	}
}

windowed_front_or_back_frame_piece_for_extended_side();
