/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <right-sega-2p-nine-panel.scad>

module sega_2p_nine_with_mount_right_overhang_panel() {
	sega_2p_nine_right_overhang_panel();
	translate([20, -50, -(panel_z/2) - 3]) pcb_mount();
}

sega_2p_nine_with_mount_right_overhang_panel();
