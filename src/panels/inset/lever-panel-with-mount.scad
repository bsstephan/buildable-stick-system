/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <lever-panel.scad>

module lever_panel_with_mount() {
	lever_panel();
	translate([0, -panel_y/2+25, -(panel_z/2) - 3]) pcb_mount();
}

lever_panel_with_mount();
