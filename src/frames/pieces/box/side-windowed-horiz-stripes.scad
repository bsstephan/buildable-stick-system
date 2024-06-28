/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>
use <side-inner-wall.scad>

module side_stripe() {
	cube([frame_wall, frame_y-(frame_mount_column_width*1.75)*2, 6], center=true);
}

module windowed_side_box_frame_piece() {
	difference() {
		side_box_frame_piece();
		// subtract frame wall windows
		translate([-(frame_x-frame_wall)/2, 0, 18]) side_stripe();
		translate([-(frame_x-frame_wall)/2, 0, 9]) side_stripe();
		translate([-(frame_x-frame_wall)/2, 0, 0]) side_stripe();
		translate([-(frame_x-frame_wall)/2, 0, -9]) side_stripe();
		translate([-(frame_x-frame_wall)/2, 0, -18]) side_stripe();
		// subtract the inner wall area that will be provided by the other piece
		side_inner_wall_frame_piece();
	}
}

windowed_side_box_frame_piece();
