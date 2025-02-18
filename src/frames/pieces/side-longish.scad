/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>

module side_frame_piece_wall() {
	// get a slice of the whole wall, to use it for making the extended version
	difference() {
		side_frame_piece();
		cube([frame_x-frame_wall*2, frame_y, frame_z], center=true);
	}
}

module side_frame_piece_extension() {
	// hulling the two walls provides a wall with a thicker x
	hull() {
		side_frame_piece_wall();
		translate([-frame_bevel_height*2, 0, 0]) side_frame_piece_wall();
	}
}

module side_longish_frame_piece() {
	// combine the wider wall and the original piece
	side_frame_piece_extension();
	side_frame_piece();
}

side_longish_frame_piece();
