/* A bit of plastic to put on the corners of a case, just for more flair and seam hiding.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module decorative_corner() {
	deco_thickness = 2;
	difference() {
		// start with the frame shape itself, just grown a bit
		resize(newsize=[frame_x+(deco_thickness*2), frame_y+(deco_thickness*2), frame_z+(deco_thickness*2)])
			frame_solid();
		// lob off the pieces to make a corner
		translate([(panel_to_frame_point_offset+deco_thickness*2)*1.5, 0, 0])
			cube([frame_x, frame_y*2, frame_z*2], center=true);
		translate([0, (panel_to_frame_point_offset+deco_thickness*2)*1.5, 0])
			cube([frame_x*2, frame_y, frame_z*2], center=true);
		// carve out the inside
		frame_solid();
		// holes for bolts
		translate([0, 0, frame_z/2]) panel_holes();
		translate([0, 0, -frame_z/2]) rotate([0, 180, 0]) panel_holes();
	}
}

decorative_corner();
