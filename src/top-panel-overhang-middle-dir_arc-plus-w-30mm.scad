/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module top_panel_middle_dir_arc_w_30mm() {
	difference() {
		panel_with_raised_overhang();
		dir_arc_w_30mm();
		rotate([0, 0, 180]) side_chopper();
		side_chopper();
	}
}

top_panel_middle_dir_arc_w_30mm();
