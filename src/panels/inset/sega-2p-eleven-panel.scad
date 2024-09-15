/* A panel with the Sega 2P button layout plus three extra buttons for whatever purpose.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module sega_2p_eleven_panel() {
	difference() {
		panel();
		sega_2p_eleven();
	}
}

sega_2p_eleven_panel();
