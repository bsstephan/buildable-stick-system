/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>
use <side-inner-wall.scad>
use <side-windowed-backslashes.scad>

module forwardslashes_windowed_side_frame_piece() {
	difference() {
		side_frame_piece();
		// subtract slashes from the frame wall
		mirror([0, 0, 1]) backslashes();
		// subtract the inner wall area that will be provided by the other piece
		side_inner_wall_frame_piece();
	}
}

forwardslashes_windowed_side_frame_piece();
