/*
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module lever_and_ergo_wasd_five_panel() {
	difference() {
		panel();
		mirror([1, 0, 0]) ergo_wasd_five_30mm();
		translate([(-panel_x/2)+55, (panel_y/2)-75, 0]) levermountholes();
		translate([(-panel_x/2)+55, (panel_y/2)-75, 0]) levermountcountersinks();
	}
}

lever_and_ergo_wasd_five_panel();
