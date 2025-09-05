/*
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module ergo_nine_plus_aux_button_panel() {
	difference() {
		panel();
		ergo_nine_30mm();
		translate([89, 30, 0]) button_24mm_hole();
	}
}

ergo_nine_plus_aux_button_panel();
