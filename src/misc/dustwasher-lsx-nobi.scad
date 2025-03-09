/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module lsx_nobi_dustwasher() {
	difference() {
		cylinder(r=lsx_nobi_dustwasher_radius, h=2, $fn=100, center=true);
		cylinder(r1=lsx_nobi_shaft_inner_radius, r2=lsx_nobi_shaft_inner_radius+shaft_position_tolerance,
			h=2.1, $fn=100, center=true);
	}
}

lsx_nobi_dustwasher();
