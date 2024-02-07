/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module top_panel_right_sega_2p_plus_one_plus_control() {
	difference() {
		top_plate_with_raised_overhang();
		sega_2p_plus_one();
		rotate([0, 0, 180]) side_chopper();
		translate([89, 30, 0]) button_24mm_hole();
	}
}

top_panel_right_sega_2p_plus_one_plus_control();
