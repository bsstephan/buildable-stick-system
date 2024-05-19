/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <../parameters.scad>
include <../components.scad>

stand_x = 5;
stand_y = frame_z-25;
stand_z = 8;

base_extra = 10;
back_extra_multiplier = 5;
rotation_alignment = 15;

module stand() {
	difference() {
		union() {
			/* front lip piece */
			translate([0, 0, stand_z/2]) cube([stand_x, stand_y, stand_z], center=true);
			/* back supporting piece */
			translate([0, (stand_y-rotation_alignment)/4, stand_z*back_extra_multiplier/2])
				cube([stand_x, (stand_y+rotation_alignment)/2, stand_z*back_extra_multiplier], center=true);
			/* base */
			translate([0, 0, 0.5]) cube([stand_x+base_extra, stand_y+base_extra, 1], center=true);
		}
		/* cut out the actual frame solid */
		translate([0, rotation_alignment, (frame_y/2)+5]) rotate([65, 0, 0]) frame_solid();
	}
}

stand();
