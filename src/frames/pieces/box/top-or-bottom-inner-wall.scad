/* The inner top/bottom wall of the frame, for being displayed through a windowed part.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frame-piece-top-or-bottom-for-box.scad>

module top_or_bottom_inner_wall_frame_piece() {
	difference() {
		top_or_bottom_box_frame_piece();
		// minus the outer wall
		translate([0, -(frame_y-frame_wall)/2, 0]) cube([frame_x, frame_wall, frame_z], center=true);
		// minus half of the mounting posts (the other half provided by the outer wall)
		translate([-panel_to_frame_point_x, -(panel_to_frame_point_y), frame_z/2]) rotate([0, 0, 180])
			frame_mount_column();
		translate([panel_to_frame_point_x, -(panel_to_frame_point_y), -frame_z/2]) rotate([0, 0, 270])
			frame_mount_column();
	}
}

top_or_bottom_inner_wall_frame_piece();
