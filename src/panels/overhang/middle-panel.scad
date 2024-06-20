/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <left-or-right-panel.scad>

module middle_overhang_panel() {
	intersection() {
		left_or_right_overhang_panel();
		mirror([1, 0, 0]) left_or_right_overhang_panel();
	}
}

middle_overhang_panel();
