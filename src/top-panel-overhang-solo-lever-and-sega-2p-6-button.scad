/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module top_panel_solo_lever_and_sega_2p_6_button() {
	difference() {
		// base plate
		union() {
			top_plate_with_raised_overhang();
			translate([-60, 18, -((top_plate_z/2)+(lever_mount_z/2))]) levermountbase();
		}
		translate([95, -20, 0]) sega_2p_6_button();
		translate([-60, 18, 0]) levermountholes();
	}
}

top_panel_solo_lever_and_sega_2p_6_button();
