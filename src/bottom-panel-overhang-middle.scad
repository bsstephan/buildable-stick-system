/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <bottom-panel-left.scad>
use <bottom-panel-right.scad>

module bottom_panel_middle() {
	intersection() {
		bottom_panel_left();
		bottom_panel_right();
	}
}

bottom_panel_middle();
