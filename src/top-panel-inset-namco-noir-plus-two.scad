/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module namco_noir_plus_two_panel() {
	difference() {
		panel();
		noir_plus_one();
		translate([32.94-3.47-3.47, -78+7.37+4.49, 0]) noir_button_p1();
	}
}

namco_noir_plus_two_panel();
