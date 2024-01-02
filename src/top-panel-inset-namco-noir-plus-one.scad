/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module namco_noir_plus_one_panel() {
	difference() {
		topplate();
		noir_plus_one();
	}
}

namco_noir_plus_one_panel();
