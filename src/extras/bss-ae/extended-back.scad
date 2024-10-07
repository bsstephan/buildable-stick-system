/* A back piece extended the rest of the depth of the base.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/extended/front-or-back.scad>

module back_piece_extension() {
	// combine the original wall with a copy to "pull" the wall out
	hull() {
		linear_extrude(height=80) bottom_piece_wall();
		linear_extrude(height=(frame_wall-frame_bevel_height)) bottom_piece_wall();
	}
}

module extended_back() {
	difference() {
		union() {
			clean_front_or_back();
			translate([0, -frame_y/2+frame_wall, 0]) rotate([90, 0, 0]) back_piece_extension();
		}
		cube([frame_x-60, frame_y+160-10, frame_z-10], center=true);
		translate([0, -frame_y/2-35, 0]) cube([frame_x-20, 70, frame_z-10], center=true);
	}
}

extended_back();
