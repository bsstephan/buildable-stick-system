/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module bottom_panel() {
	difference() {
		mirror([0, 0, 1]) panel();
		translate([0, 0, panel_z/2]) cube([panel_x-40, panel_y-40, panel_z], center=true);
	}
}

bottom_panel();
