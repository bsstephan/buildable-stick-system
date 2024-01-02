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
		union() {
			translate([0,-20,0])
				topplate();
			translate([0, 0, -((top_plate_z/2)+(lever_mount_z/2))])
				levermountbase();
		}
		// holes to mount the lever
		levermountholes();
	}
}

lever_panel();
