/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frame-piece-top-or-bottom-for-box.scad>

module top_or_bottom_box_frame_piece_for_extended_side() {
	difference() {
		top_or_bottom_box_frame_piece();
		// ...minus the frame wall and lip on the left
		translate([-frame_x/2+frame_wall/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
	}
}

top_or_bottom_box_frame_piece_for_extended_side();
