/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>
use <front-or-back-inner-wall.scad>

module backslash() {
	polyhedron([[5, -frame_y/2, -(frame_z-panel_z*3)/2], [20, -frame_y/2, -(frame_z-panel_z*3)/2],
			[20, -frame_y/2+frame_wall, -(frame_z-panel_z*3)/2], [5, -frame_y/2+frame_wall, -(frame_z-panel_z*3)/2],
			[-20, -frame_y/2, (frame_z-panel_z*3)/2], [-5, -frame_y/2, (frame_z-panel_z*3)/2],
			[-5, -frame_y/2+frame_wall, (frame_z-panel_z*3)/2], [-20, -frame_y/2+frame_wall, (frame_z-panel_z*3)/2]],
		[[0, 1, 2, 3], [4, 5, 1, 0], [7, 6, 5, 4], [5, 6, 2, 1], [6, 7, 3, 2], [7, 4, 0, 3]]
	);
}

module backslashes() {
	translate([-60, 0, 0]) backslash();
	translate([-40, 0, 0]) backslash();
	translate([-20, 0, 0]) backslash();
	backslash();
	translate([20, 0, 0]) backslash();
	translate([40, 0, 0]) backslash();
	translate([60, 0, 0]) backslash();
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
