/*
 * A stick mount that fits rectangular (non-extended) BSS sticks.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <../parameters.scad>
include <../components.scad>

holder_x = 114;
holder_y = 60;
holder_z = 45;
tall_holder_post = frame_y-10;

module stick_holder() {
	difference() {
		cube([holder_x, holder_y, holder_z], center=true);
		translate([14, 0, 132]) rotate([90, -40, 0]) frame_solid();
	}
}

module mount() {
	difference() {
		union() {
			// lowest post
			translate([62, -frame_z-25, holder_z/2]) stick_holder();				// top = 45

			// middle post
			translate([0, 0, ((tall_holder_post)/2)/2])
				cube([holder_x, holder_y, (tall_holder_post)/2], center=true);
			translate([0, 0, ((tall_holder_post)/2)+holder_z/2]) stick_holder();			// top = 139

			// highest post
			translate([-62, frame_z+25, tall_holder_post/2])
				cube([holder_x, holder_y, tall_holder_post], center=true);
			translate([-62, frame_z+25, tall_holder_post+holder_z/2]) stick_holder();		// top = 233

			// post stabilizers
			translate([31, -41, holder_z/2]) cube([52, 23, holder_z], center=true);
			translate([-31, 41, ((tall_holder_post/2)+holder_z)/2])
				cube([52, 23, (tall_holder_post/2)+holder_z], center=true);

			// base
			hull() {
				translate([110, 103, -2.5]) cylinder(r=15, h=5, center=true);
				translate([110, -103, -2.5]) cylinder(r=15, h=5, center=true);
				translate([-110, 103, -2.5]) cylinder(r=15, h=5, center=true);
				translate([-110, -103, -2.5]) cylinder(r=15, h=5, center=true);
			}

			// placard
			translate([0, -112, 15]) cube([frame_y, 5, 30], center=true);

			/* // test */
			/* translate([62+14, -frame_z-25, 132+holder_z/2]) rotate([90, -40, 0]) frame_solid(); */
			/* translate([14, 0, 132+(frame_y/2)-20+holder_z/2]) rotate([90, -40, 0]) frame_solid(); */
			/* translate([-62+14, frame_z+25, 132+tall_holder_post+holder_z/2]) rotate([90, -40, 0]) frame_solid(); */
		}
		// text on the placard
		translate([-frame_z*3.3/2.5, -holder_x, 15]) rotate([90, 0, 0])
			linear_extrude(1) text("Buildable Stick System", font="Noto Sans");
		translate([-frame_z*3.3/2.5, -holder_x, 4]) rotate([90, 0, 0])
			linear_extrude(1) text("v4 by bss", font="Noto Sans", size=6);
	}
}

mount();
