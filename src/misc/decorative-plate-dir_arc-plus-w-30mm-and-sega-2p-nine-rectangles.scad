/*
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
jumbo_decorative_radius_scale = 0;
include <components.scad>

module dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_plate_of_plates() {
	difference() {
		// layout offset + 30 = width for layout plus button width + 19+3 = space around button
		left_plate_x = dir_arc_30mm_column_3_offset + 30 + 19;
		// layout offset + 30 = width for layout plus button width + 19+3 = space around button
		left_plate_y = dir_arc_w_30mm_row_4_offset + 30 + 19;
		left_plate_center_x = (left_plate_x + sega_2p_column_1_left_panel_edge_offset - 22)/2;
		// layout offset + 30 = width for layout plus button width + 19+3 = space around button
		right_plate_x = sega_2p_column_4_offset + 30 + 19;
		right_plate_center_x = (right_plate_x + sega_2p_column_1_left_panel_edge_offset - 22)/2;

		union() {
			// y values are based on the other half below
			translate([right_plate_center_x, 15, 0]) linear_extrude(2) offset(r=3, $fn=50)
				square([right_plate_x, left_plate_y], center=true);
			translate([-left_plate_center_x, 15, 0]) linear_extrude(2) offset(r=3, $fn=50)
				square([left_plate_x, left_plate_y], center=true);
			/* translate([-50, 0, 0]) cube([200, 200, 2], center=true); */
		}
		// cut out the normal holes
		translate([-panel_x/2, 0, -1]) dir_arc_w_30mm();
		translate([panel_x/2, 0, -1]) sega_2p_nine();
	}
}

dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_plate_of_plates();
