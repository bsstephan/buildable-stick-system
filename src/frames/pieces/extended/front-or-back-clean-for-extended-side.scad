/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/box/front-or-back.scad>

module front_or_back_box_frame_piece_for_extended_side() {
	difference() {
		front_or_back_box_frame_piece();
		// ...minus the frame wall and lip on the left
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
	}
}

front_or_back_box_frame_piece_for_extended_side();
