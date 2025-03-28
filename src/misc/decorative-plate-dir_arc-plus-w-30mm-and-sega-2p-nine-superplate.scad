/* decorative plate for directional and action buttons.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
decorative_radius_scale = 1.5;
include <components.scad>

module dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_superplate() {
	difference() {
		union() {
			hull() difference() {
				// get a 2mm slice of the decorative button cylinders
				union() {
					translate([-panel_x/2, 0, -50]) dir_arc_w_30mm();
					translate([panel_x/2, 0, -50]) sega_2p_nine();
					// customized position to make a top point even with the
					// top of the dir_arc_w_30mm piece, because it being
					// at an angle otherwise looks silly IMO
					translate([panel_x*23/32, 26.6, -50]) sega_2p_p1();
				}
				translate([0, 0, -100]) cube([500, 500, 198], center=true);
				translate([0, 0, 100]) cube([500, 500, 198], center=true);
			}
		}
		// cut out the normal holes
		translate([-panel_x/2, 0, -1]) dir_arc_w_30mm();
		translate([panel_x/2, 0, -1]) sega_2p_nine();
	}
}

dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_superplate();
