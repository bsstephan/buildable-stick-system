/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>
use <side-inner-wall.scad>

module backslashes() {
	translate([-(frame_x-frame_wall)/2, -50, 0]) rotate([0, 0, -90]) slash_cutout();
	translate([-(frame_x-frame_wall)/2, -30, 0]) rotate([0, 0, -90]) slash_cutout();
	translate([-(frame_x-frame_wall)/2, -10, 0]) rotate([0, 0, -90]) slash_cutout();
	translate([-(frame_x-frame_wall)/2, 10, 0]) rotate([0, 0, -90]) slash_cutout();
	translate([-(frame_x-frame_wall)/2, 30, 0]) rotate([0, 0, -90]) slash_cutout();
	translate([-(frame_x-frame_wall)/2, 50, 0]) rotate([0, 0, -90]) slash_cutout();
}

module backslashes_windowed_side_frame_piece() {
	difference() {
		side_frame_piece();
		// subtract slashes from the frame wall
		backslashes();
		// subtract the inner wall area that will be provided by the other piece
		side_inner_wall_frame_piece();
	}
}

backslashes_windowed_side_frame_piece();
