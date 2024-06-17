/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <../parameters.scad>
include <../components.scad>
use <stand.scad>

module stand_base() {
	difference() {
		cube([frame_x, stand_y*2, 3], center=true);
		translate([0, 0, 1.5]) rotate([180, 0, 0]) stand();
		translate([-frame_x*0.4, 0, 1.5]) rotate([180, 0, 0]) stand();
		translate([frame_x*0.4, 0, 1.5]) rotate([180, 0, 0]) stand();
	}
}

stand_base();
