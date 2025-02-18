/*
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>

module front_or_back_frame_piece_wall() {
	// get a slice of the whole wall, to use it for making the extended version
	difference() {
		front_or_back_frame_piece();
		cube([frame_x, frame_y-frame_wall*2, frame_z], center=true);
	}
}

module front_or_back_frame_piece_extension() {
	hull() {
		front_or_back_frame_piece_wall();
		translate([0, -frame_bevel_height*2, 0]) front_or_back_frame_piece_wall();
	}
}

module front_or_back_longish_frame_piece() {
	front_or_back_frame_piece_extension();
	front_or_back_frame_piece();
}

front_or_back_longish_frame_piece();
