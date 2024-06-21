/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <top-or-bottom.scad>
use <top-or-bottom-inner-wall.scad>
use <top-or-bottom-windowed-backslashes.scad>

module forwardslashes_windowed_top_or_bottom_box_frame_piece() {
	difference() {
		top_or_bottom_box_frame_piece();
		// subtract slashes from the frame wall
		mirror([0, 0, 1]) backslashes();
		// subtract the inner wall area that will be provided by the other piece
		top_or_bottom_inner_wall_frame_piece();
	}
}

forwardslashes_windowed_top_or_bottom_box_frame_piece();
