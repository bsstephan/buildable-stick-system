/* A top panel in the very popular Sega 2P layout.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module sega_2p_panel() {
	difference() {
		panel();
		sega_2p();
	}
}

sega_2p_panel();
