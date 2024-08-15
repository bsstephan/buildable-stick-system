/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <panels/inset/panel.scad>

// X: inner post to post (inclusive) is approx. 428.625mm, so half that, minus half the post itself
// (41.28mm) is how much in from a normal panel to put the M6 mounting hole
// Y: eyeballed it to 2": 50.80mm
mount_hole_x = (panel_x / 2) - (panel_x - ((428.625 / 2) - (41.28 / 2)));
mount_hole_y = (panel_y / 2) - 50.80;

module front_left_mount_panel() {
	difference() {
		union() {
			panel();
			translate([-mount_hole_x, -mount_hole_y, panel_z/2]) cylinder(r=15, h=4, $fn=50, center=true);
		}
		translate([-mount_hole_x, -mount_hole_y, 0]) m6_hole();
	}
}

front_left_mount_panel();
