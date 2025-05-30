/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <right-sega-2p-nine-plus-aux-button.scad>

module sega_2p_nine_plus_aux_button_right_overhang_panel_with_mount() {
	sega_2p_nine_plus_aux_button_right_overhang_panel();
	translate([30, -50, -(panel_z/2) - 3]) pcb_mount();
}

sega_2p_nine_plus_aux_button_right_overhang_panel_with_mount();
