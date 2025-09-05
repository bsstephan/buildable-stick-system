/* 11-button Sega 2P panel with PCB mount
 *
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <sega-2p-eleven-panel.scad>

module sega_2p_eleven_panel_with_mount() {
	sega_2p_eleven_panel();
	translate([20, -50, -(panel_z/2) - 3]) pcb_mount();
}

sega_2p_eleven_panel_with_mount();
