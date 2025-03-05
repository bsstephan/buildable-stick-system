/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module jlf_dustwasher() {
	difference() {
		cylinder(r=lever_plate_hole*decorative_radius_scale, h=2, $fn=100, center=true);
		// 5.25 = 4.55 (diameter of shaft is 9.10mm) + .25 to let it take an angle
		cylinder(r=4.8, h=2.1, $fn=100, center=true);
	}
}

jlf_dustwasher();
