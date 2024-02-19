/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module bottom_panel_solo() {
	difference() {
		overhang_plate();
		rotate([180, 0, 0]) panel_holes();
	}
}

bottom_panel_solo();
