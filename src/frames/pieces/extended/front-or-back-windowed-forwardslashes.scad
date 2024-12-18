/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>
use <front-or-back-inner-wall.scad>
use <front-or-back-windowed-backslashes.scad>

module forwardslashes_windowed_front_or_back_frame_piece() {
	difference() {
		front_or_back_frame_piece();
		// subtract slashes from the frame wall
		mirror([0, 0, 1]) backslashes();
		// subtract the inner wall area that will be provided by the other piece
		front_or_back_inner_wall_frame_piece();
	}
}

module forwardslashes_windowed_front_or_back_frame_piece_for_extended_side() {
	difference() {
		forwardslashes_windowed_front_or_back_frame_piece();
		// ...minus the frame wall and lip on the left
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
	}
}

forwardslashes_windowed_front_or_back_frame_piece_for_extended_side();
