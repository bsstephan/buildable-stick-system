/* A back piece of the enclosure, with a mounting hole.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <extended-back.scad>

// X: inner post to post (inclusive) is approx. 428.625mm, so half that, minus half the post itself
// (41.28mm) is how much in from a normal panel to put the M6 mounting hole
// Y: eyeballed it to 30mm
mount_hole_x = (panel_x / 2) - (panel_x - ((428.625 / 2) - (41.28 / 2)));
mount_hole_y = (panel_y / 2) + 30;

module left_mount_extended_back() {
	difference() {
		extended_back();
		translate([mount_hole_x, -mount_hole_y, -30]) m6_hole();
		// punch out the back for cables
		cube([frame_x-70, frame_y+160, frame_z-20], center=true);
	}
}

left_mount_extended_back();
