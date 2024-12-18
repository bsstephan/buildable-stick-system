/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>
use <front-or-back-inner-wall.scad>

module backslashes() {
	translate([-70, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([-50, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([-30, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([-10, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([10, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([30, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([50, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([70, -(frame_y-frame_wall)/2, 0]) slash_cutout();
}

module backslashes_windowed_front_or_back_frame_piece() {
	difference() {
		front_or_back_frame_piece();
		// subtract slashes from the frame wall
		backslashes();
		// subtract the inner wall area that will be provided by the other piece
		front_or_back_inner_wall_frame_piece();
	}
}

module backslashes_windowed_front_or_back_frame_piece_for_extended_side() {
	difference() {
		backslashes_windowed_front_or_back_frame_piece();
		// ...minus the frame wall and lip on the left
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
	}
}

backslashes_windowed_front_or_back_frame_piece_for_extended_side();
