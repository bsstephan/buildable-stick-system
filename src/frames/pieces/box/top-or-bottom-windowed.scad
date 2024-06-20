/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <top-or-bottom.scad>
use <top-or-bottom-inner-wall.scad>

module windowed_top_or_bottom_box_frame_piece() {
	difference() {
		top_or_bottom_box_frame_piece();
		// subtract frame wall window
		translate([0, -frame_y/2, 0])
			cube([frame_x-frame_mount_column_width*3.5, (frame_wall+panel_support_width)*2,
				frame_z-panel_z*3], center=true);
		// subtract the inner wall area that will be provided by the other piece
		top_or_bottom_inner_wall_frame_piece();
	}
}

windowed_top_or_bottom_box_frame_piece();
