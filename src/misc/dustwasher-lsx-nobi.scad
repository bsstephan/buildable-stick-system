/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module lsx_nobi_dustwasher() {
	difference() {
		cylinder(r=lever_plate_hole*decorative_radius_scale, h=2, $fn=50, center=true);
		// 5.25 = 5 (diameter of shaft is 10mm) + .25 to let it take an angle
		cylinder(r=5.25+hole_tolerance, h=2.1, $fn=50, center=true);
	}
}

lsx_nobi_dustwasher();
