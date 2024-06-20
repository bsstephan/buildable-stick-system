/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

// combine the lever mount and generic plate, with mounting holes
module lever_panel() {
	difference() {
		// base plate
		translate([0,-20,0]) panel();
		// holes to mount the lever
		levermountholes();
		levermountcountersinks();
	}
}

lever_panel();
