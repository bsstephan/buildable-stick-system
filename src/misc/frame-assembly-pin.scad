/* Fit a pin for the assembly holes.
 *
 * SPDX-FileCopyrightText: © 2026 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
include <parameters.scad>
include <components.scad>

module frame_assembly_pin() {
	difference() {
		scale([0.95, 0.95, 0.95]) resize([0, 0, inner_frame_z]) frame_hex_bolt_hole();
		scale([0.85, 0.85, 1]) resize([0, 0, inner_frame_z]) m4_hole();
	}
}


frame_assembly_pin();
