/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <solo-panel.scad>

module left_or_right_overhang_panel() {
	difference() {
		solo_overhang_panel();
		// chop the right edge off
		side_chopper();
	}
}

left_or_right_overhang_panel();
