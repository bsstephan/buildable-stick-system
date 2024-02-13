/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <top-panel-overhang-middle-dir_arc-plus-w-30mm.scad>

module top_panel_middle_dir_arc_w_30mm_with_mount() {
	top_panel_middle_dir_arc_w_30mm();
	translate([-15, -40, -(panel_z/2) - 3]) rotate([0, 0, -45]) pcb_mount();
}

top_panel_middle_dir_arc_w_30mm_with_mount();
