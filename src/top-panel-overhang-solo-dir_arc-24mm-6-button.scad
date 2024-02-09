/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module dir_arc_24mm_6_button_panel() {
	difference() {
		panel_with_raised_overhang();
		translate([-71.5, -panel_y/2+122.5, 0]) dir_arc_24mm_6_button();
	}
}

dir_arc_24mm_6_button_panel();
