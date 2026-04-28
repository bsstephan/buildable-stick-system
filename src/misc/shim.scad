/* A simple shim for improving panel-to-frame fit.
 *
 * SPDX-FileCopyrightText: © 2026 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module shim() {
	difference() {
		cube([frame_wall*2, frame_wall*2, 2]);
		rotate([0, 5, 0]) translate([-frame_wall, 0, 0.75]) cube([frame_wall*3, frame_wall*3, 2]);
	}
}

shim();
