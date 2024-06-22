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

module side_inner_wall_frame_piece() {
	difference() {
		side_box_frame_piece();
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

side_inner_wall_frame_piece();
