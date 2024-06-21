/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>

module side_box_frame_piece() {
	piece_width = panel_support_width+frame_wall+frame_mount_column_width;
	difference() {
		// side piece is left/right agnostic
		frame();
		// minus the top and bottom
		front_or_back_box_frame_piece();
		rotate([180, 0, 0]) front_or_back_box_frame_piece();
		// and just chop out the rest of the frame
		translate([piece_width, 0, 0]) cube([frame_x, frame_y+1, frame_z+1], center=true);
	}
}

side_box_frame_piece();
