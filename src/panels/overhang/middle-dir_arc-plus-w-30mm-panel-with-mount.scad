/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <middle-dir_arc-plus-w-30mm-panel.scad>

module dir_arc_w_30mm_middle_overhang_panel_with_mount() {
	dir_arc_w_30mm_middle_overhang_panel();
	translate([-15, -40, -(panel_z/2) - 3]) rotate([0, 0, -45]) pcb_mount();
}

dir_arc_w_30mm_middle_overhang_panel_with_mount();
