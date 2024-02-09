/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module dir_arc_plus_w_24mm_8_button_panel() {
	difference() {
		panel_with_raised_overhang();
		translate([-80.5, panel_y/6, 0]) dir_arc_plus_w_24mm_8_button();
	}
}

dir_arc_plus_w_24mm_8_button_panel();
