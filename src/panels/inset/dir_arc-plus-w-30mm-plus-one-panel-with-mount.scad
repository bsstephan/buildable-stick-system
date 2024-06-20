/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <dir_arc-plus-w-30mm-plus-one-panel.scad>

module dir_arc_w_30mm_plus_one_panel_with_mount() {
	dir_arc_w_30mm_plus_one_panel();
	translate([-15, -40, -(panel_z/2) - 3]) rotate([0, 0, -15]) pcb_mount();
}

dir_arc_w_30mm_plus_one_panel_with_mount();
