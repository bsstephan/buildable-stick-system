/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
jumbo_decorative_radius_scale = 0;
include <components.scad>

module dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate_of_plates() {
	difference() {
		// get a 2mm slice of the bigger button cylinders
		union() {
			translate([-top_plate_x/2, 0, -25]) {
				hull() union() {
					dir_arc_30mm_finger_buttons();
					translate([-26.8, 57.2+12.9+34.5, 0]) dir_arc_30mm_thumb_button();
				}
			}
			translate([top_plate_x/2, 0, -25]) {
				hull() sega_2p();
			}
			hull() {
				translate([-top_plate_x/2, 0, -25]) dir_arc_30mm_thumb_button();
				translate([top_plate_x/2, -19-9-11-19-9-11, -25]) sega_2p_p1();
			}
			difference() {
				translate([-60, -8, 0]) cube(60, center=true);
				translate([-98.35, -39.25, 0]) cylinder(h=50, r=48, $fn=50, center=true);
			}
			difference() {
				translate([43.35, -10.30, 0]) cube(50, center=true);
				translate([68.35, -35.30, 0]) cylinder(h=50, r=18, $fn=50, center=true);
			}
			difference() {
				translate([-10, 55, 0]) cube(43, center=true);
				translate([-5.15, 76.25, 0]) cylinder(h=50, r=27, $fn=50, center=true);
			}
			translate([-7, 0, 0]) cube(80, center=true);
		}
		translate([0, 0, -100]) cube([500, 500, 198], center=true);
		translate([0, 0, 100]) cube([500, 500, 198], center=true);
		// cut out the normal holes
		translate([-top_plate_x/2, 0, -1]) dir_arc_w_30mm();
		translate([top_plate_x/2, 0, -1]) sega_2p_plus_one();
	}
}

dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate_of_plates();
