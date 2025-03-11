/* A bit of plastic to put on the center of a case front, just for more flair and seam hiding.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module decorative_half_middle() {
	deco_thickness = 2;
	translate([-frame_x/2+frame_wall, 0, 0]) difference() {
		// start with the frame shape itself, just grown a bit
		resize(newsize=[frame_x+(deco_thickness*2), frame_y+(deco_thickness*2), frame_z+(deco_thickness*2)])
			frame_solid();
		// make this appropriate for the middle
		scale([1, 1, 2]) side_chopper();
		// lob off the pieces to make a cornerish piece
		translate([-(panel_to_frame_point_offset+deco_thickness*2)*1.65, 0, 0])
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

module decorative_middle() {
	decorative_half_middle();
	mirror([1, 0, 0]) decorative_half_middle();
}

decorative_middle();
