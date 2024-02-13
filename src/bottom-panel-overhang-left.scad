/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <bottom-panel-overhang-solo.scad>

module bottom_panel_left() {
	difference() {
		bottom_panel_solo();
		// chop the right edge off
		side_chopper();
	}
}

bottom_panel_left();
