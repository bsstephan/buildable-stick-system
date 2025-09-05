/*
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <ergo-nine-plus-aux-button.scad>

module ergo_nine_plus_aux_button_panel_with_mount() {
	ergo_nine_plus_aux_button_panel();
	translate([20, -50, -(panel_z/2) - 3]) pcb_mount();
}

ergo_nine_plus_aux_button_panel_with_mount();
