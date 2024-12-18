/* The inner top/bottom wall of the frame, for being displayed through a windowed part.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back.scad>

module mount_column_cutout() {
	intersection() {
		frame_mount_column();
		cube([frame_mount_column_width*3/2, frame_mount_column_width*3/2, inner_frame_z*5/8], center=true);
	}
}

module front_or_back_inner_wall_frame_base_piece() {
	difference() {
		// Z is scaled so that some part of the original part inner wall is retained
		scale([1, 1, inner_frame_z_decorative_scale]) front_or_back_frame_piece();
		// minus the outer wall
		translate([0, -(frame_y-frame_wall)/2, 0]) cube([frame_x, frame_wall, frame_z], center=true);
		// minus half of the mounting posts (the other half provided by the outer wall)
		translate([-panel_to_frame_point_x, -(panel_to_frame_point_y), 0]) rotate([0, 0, 180])
			mount_column_cutout();
		translate([panel_to_frame_point_x, -(panel_to_frame_point_y), 0]) rotate([0, 0, 270])
			mount_column_cutout();
	}
}

module front_or_back_inner_wall_frame_piece() {
	front_or_back_inner_wall_frame_base_piece();
	// extend the outward face 2mm in order to have it cut deeper into the frame outer wall
	translate([0, -(frame_y-frame_wall)/2, 0]) rotate([-90, 0, 0]) linear_extrude(height=2) projection()
		translate([0, 0, 50]) rotate([90, 0, 0]) front_or_back_inner_wall_frame_base_piece();
}

front_or_back_inner_wall_frame_piece();
