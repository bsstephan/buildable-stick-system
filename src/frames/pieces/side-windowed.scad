/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>
use <side-inner-wall.scad>

module windowed_side_frame_piece() {
	difference() {
		side_frame_piece();
		// subtract frame wall window
		translate([-frame_x/2, 0, 0])
			cube([(frame_wall+panel_support_width)*2, frame_y-frame_mount_column_width*3.5,
				frame_z-panel_z*3], center=true);
		// subtract the inner wall area that will be provided by the other piece
		side_inner_wall_frame_piece();
	}
}

windowed_side_frame_piece();
