/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>
use <front-or-back-inner-wall.scad>

module backslashes() {
	translate([-60, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([-40, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([-20, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([0, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([20, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([40, -(frame_y-frame_wall)/2, 0]) slash_cutout();
	translate([60, -(frame_y-frame_wall)/2, 0]) slash_cutout();
}

module backslashes_windowed_front_or_back_box_frame_piece() {
	difference() {
		front_or_back_box_frame_piece();
		// subtract slashes from the frame wall
		backslashes();
		// subtract the inner wall area that will be provided by the other piece
		front_or_back_inner_wall_frame_piece();
	}
}

backslashes_windowed_front_or_back_box_frame_piece();
