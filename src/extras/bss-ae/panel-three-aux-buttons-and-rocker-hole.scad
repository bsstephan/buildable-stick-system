/* A panel for mounting a couple aux buttons in a out of the way spot.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module three_aux_button_and_20mm_panel() {
	difference() {
		panel();
		translate([0, -70, 0]) aux_control_three_button_tight_cluster();
		translate([0, frame_y/2-30, 0]) rotate([180, 0, 0]) neutrik_d_mount();
	}
}

three_aux_button_and_20mm_panel();
