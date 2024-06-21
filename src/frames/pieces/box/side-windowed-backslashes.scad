/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>
use <side-inner-wall.scad>

module backslash() {
	polyhedron([[-frame_x/2, -5, -(frame_z-panel_z*3)/2], [-frame_x/2, -20, -(frame_z-panel_z*3)/2],
			[-frame_x/2+frame_wall, -20, -(frame_z-panel_z*3)/2], [-frame_x/2+frame_wall, -5, -(frame_z-panel_z*3)/2],
			[-frame_x/2, 20, (frame_z-panel_z*3)/2], [-frame_x/2, 5, (frame_z-panel_z*3)/2],
			[-frame_x/2+frame_wall, 5, (frame_z-panel_z*3)/2], [-frame_x/2+frame_wall, 20, (frame_z-panel_z*3)/2]],
		[[0, 1, 2, 3], [4, 5, 1, 0], [7, 6, 5, 4], [5, 6, 2, 1], [6, 7, 3, 2], [7, 4, 0, 3]]
	);
}

module backslashes() {
	translate([0, -40, 0]) backslash();
	translate([0, -20, 0]) backslash();
	backslash();
	translate([0, 20, 0]) backslash();
	translate([0, 40, 0]) backslash();
}

module backslashes_windowed_side_box_frame_piece() {
	difference() {
		side_box_frame_piece();
		// subtract slashes from the frame wall
		backslashes();
		// subtract the inner wall area that will be provided by the other piece
		side_inner_wall_frame_piece();
	}
}

backslashes_windowed_side_box_frame_piece();
