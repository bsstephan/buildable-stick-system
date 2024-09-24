/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module sega_2p_nine_panel() {
	difference() {
		panel();
		sega_2p_nine();
	}
}

sega_2p_nine_panel();
