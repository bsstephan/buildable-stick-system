/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module lever_and_sega_2p_6_button_panel_with_aux_with_mount() {
	difference() {
		union() {
			panel();
			translate([45, -58, -panel_z/2]) rotate([0, 0, 13]) pcb_mount();
		}
		translate([90, -25, 0]) sega_2p_6_button();
		translate([-65, 5, 0]) union() {
			levermountholes();
			levermountcountersinks();
		}
		translate([17, 70, 0]) button_24mm_hole();
		translate([-17, 70, 0]) button_24mm_hole();
	}
}

lever_and_sega_2p_6_button_panel_with_aux_with_mount();
