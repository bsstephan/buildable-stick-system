/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module dir_arc_w_30mm_panel() {
	difference() {
		panel();
		dir_arc_w_30mm();
	}
}

dir_arc_w_30mm_panel();
