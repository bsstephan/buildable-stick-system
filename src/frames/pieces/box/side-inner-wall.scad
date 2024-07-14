/* The inner side wall of the frame, for being displayed through a windowed part.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side.scad>

module mount_column_cutout() {
	intersection() {
		frame_mount_column();
		cube([frame_mount_column_width*3/2, frame_mount_column_width*3/2, inner_frame_z*21/24], center=true);
	}
}

module side_inner_wall_frame_base_piece() {
	difference() {
		// Z is scaled so that some part of the original part inner wall is retained
		scale([1, 1, inner_frame_z_decorative_scale]) side_box_frame_piece();
		// minus the outer wall
		translate([-(frame_x-frame_wall)/2, 0, 0]) cube([frame_wall, frame_y, frame_z], center=true);
		// minus half of the mounting posts (the other half provided by the outer wall)
		translate([-panel_to_frame_point_x, panel_to_frame_point_y, inner_frame_z/2]) rotate([0, 0, 90])
			mount_column_cutout();
		translate([-panel_to_frame_point_x, -(panel_to_frame_point_y), -inner_frame_z/2]) rotate([0, 0, 180])
			mount_column_cutout();
		translate([-panel_to_frame_point_x, panel_to_frame_point_y, -inner_frame_z/2]) rotate([0, 0, 90])
			mount_column_cutout();
		translate([-panel_to_frame_point_x, -(panel_to_frame_point_y), inner_frame_z/2]) rotate([0, 0, 180])
			mount_column_cutout();
	}
}

module side_inner_wall_frame_piece() {
	side_inner_wall_frame_base_piece();
	// extend the outward face 2mm in order to have it cut deeper into the frame outer wall
	translate([-(frame_x-frame_wall)/2, 0, 0]) rotate([0, 90, 0]) linear_extrude(height=2) projection()
		translate([0, 0, 50]) rotate([0, -90, 0]) side_inner_wall_frame_base_piece();
}

side_inner_wall_frame_piece();
