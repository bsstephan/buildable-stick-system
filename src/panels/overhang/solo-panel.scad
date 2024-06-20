/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module solo_overhang_panel() {
	difference() {
		rotate([180, 0, 0]) base_panel_with_raised_overhang();
		rotate([180, 0, 0]) panel_holes();
	}
}

solo_overhang_panel();
