/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module top_panel_right_sega_2p_plus_one() {
	difference() {
		top_plate_with_raised_overhang();
		sega_2p_plus_one();
		rotate([0, 0, 180]) side_chopper();
	}
}

top_panel_right_sega_2p_plus_one();
