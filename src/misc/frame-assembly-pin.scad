/* Fit a pin for the assembly holes.
 *
 * SPDX-FileCopyrightText: © 2026 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
include <parameters.scad>
include <components.scad>

// adjust the pin to have a good friction fit based on parameters
pin_fit_scale = ((m4_bolt_hex_exterior_radius-hole_tolerance)*2)/(m4_bolt_hex_exterior_radius*2);

module frame_assembly_pin() {
	difference() {
		scale([pin_fit_scale, pin_fit_scale, 0.95]) resize([0, 0, inner_frame_z]) frame_hex_bolt_hole();
		scale([0.8, 0.8, 1]) resize([0, 0, inner_frame_z]) m4_hole();
	}
}


frame_assembly_pin();
