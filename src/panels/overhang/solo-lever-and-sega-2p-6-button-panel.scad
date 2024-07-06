/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module lever_and_sega_2p_6_button_solo_overhang_panel() {
	difference() {
		panel_with_raised_overhang();
		translate([90, -25, 0]) sega_2p_6_button();
		translate([-65, 5, 0]) union() {
			levermountholes();
			levermountcountersinks();
		}
		translate([17, 70, 0]) button_24mm_hole();
		translate([-17, 70, 0]) button_24mm_hole();
	}
}

lever_and_sega_2p_6_button_solo_overhang_panel();
