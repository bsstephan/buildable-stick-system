/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>
use <front-or-back-inner-wall.scad>

module front_stripe() {
	cube([frame_x-(frame_mount_column_width*1.75)*2, frame_wall, 5], center=true);
}

module horiz_striped_windowed_front_or_back_box_frame_piece() {
	difference() {
		front_or_back_box_frame_piece();
		// subtract frame wall windows
		translate([0, -(frame_y-frame_wall)/2, 17.5]) front_stripe();
		translate([0, -(frame_y-frame_wall)/2, 10.5]) front_stripe();
		translate([0, -(frame_y-frame_wall)/2, 3.5]) front_stripe();
		translate([0, -(frame_y-frame_wall)/2, -3.5]) front_stripe();
		translate([0, -(frame_y-frame_wall)/2, -10.5]) front_stripe();
		translate([0, -(frame_y-frame_wall)/2, -17.5]) front_stripe();
		// subtract the inner wall area that will be provided by the other piece
		front_or_back_inner_wall_frame_piece();
	}
}

horiz_striped_windowed_front_or_back_box_frame_piece();
