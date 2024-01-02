/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module sega_2p_plus_one_panel() {
	difference() {
		topplate();
		sega_2p_plus_one();
	}
}

sega_2p_plus_one_panel();
