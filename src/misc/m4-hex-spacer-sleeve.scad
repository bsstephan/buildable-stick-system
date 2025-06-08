/* Wrap a smaller width hex spacer with plastic to get it to fit in our standard post hole.
 *
 * Since the hex spacers can vary in width, you may have to adjust the inner dimensions
 * to make this work right for your piece, but this worked right for mine. YMMV.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
include <parameters.scad>
include <components.scad>

module small_m4_hole() {
	scale([1, 1, 2]) cylinder(r=3.25, h=frame_z, $fn=6, center=true);
}

module m4_hex_spacer_sleeve() {
	difference() {
		resize([0, 0, 45]) frame_hex_bolt_hole();
		small_m4_hole();
	}
}


m4_hex_spacer_sleeve();
