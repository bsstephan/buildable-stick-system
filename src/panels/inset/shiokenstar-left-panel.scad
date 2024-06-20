/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module shiokenstar_left_panel() {
	difference() {
		translate([-frame_x/2+frame_wall, 0, 0]) panel();
		translate([75, 0, 0]) shiokenstar();
	}
}

shiokenstar_left_panel();
