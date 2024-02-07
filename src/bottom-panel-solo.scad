/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module bottom_panel_solo() {
	difference() {
		rotate([180, 0, 0]) base_top_plate_with_raised_overhang();
		rotate([180, 0, 0]) top_plate_holes();
	}
}

bottom_panel_solo();
