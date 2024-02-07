/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <bottom-panel-left.scad>

module bottom_panel_right() {
	rotate([0, 0, 180]) bottom_panel_left();
}

bottom_panel_right();
