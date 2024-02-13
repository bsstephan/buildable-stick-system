/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <top-panel-overhang-right-sega-2p-plus-one.scad>

module top_panel_right_sega_2p_plus_one_with_mount() {
	top_panel_right_sega_2p_plus_one();
	translate([30, -50, -(panel_z/2) - 3]) pcb_mount();
}

top_panel_right_sega_2p_plus_one_with_mount();
