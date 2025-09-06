/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module neutrik_d_plate() {
	difference() {
		cube([30, 35, 2], center=true);
		translate([9.5, 12, 0]) neutrik_d_screw_hole();
		translate([-9.5, -12, 0]) neutrik_d_screw_hole();
	}
}

neutrik_d_plate();
