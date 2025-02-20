/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>
use <side-inner-wall.scad>

module side_horiz_stripe() {
	cube([wall_cutout_depth, frame_y-(frame_mount_column_width*1.75)*2, 5], center=true);
}

module side_horiz_stripes() {
	translate([-(frame_x-frame_wall)/2, 0, 18]) side_horiz_stripe();
	translate([-(frame_x-frame_wall)/2, 0, 9]) side_horiz_stripe();
	translate([-(frame_x-frame_wall)/2, 0, 0]) side_horiz_stripe();
	translate([-(frame_x-frame_wall)/2, 0, -9]) side_horiz_stripe();
	translate([-(frame_x-frame_wall)/2, 0, -18]) side_horiz_stripe();
}

module horiz_striped_windowed_side_frame_piece() {
	difference() {
		side_frame_piece();
		// subtract frame wall windows
		side_horiz_stripes();
		// subtract the inner wall area that will be provided by the other piece
		side_inner_wall_frame_piece();
	}
}

horiz_striped_windowed_side_frame_piece();
