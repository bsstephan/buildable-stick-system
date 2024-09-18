/* Just a simple washer to go between the frame post and the arcade enclosure.
 *
 * SPDX-FileCopyrightText: © 2024 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module mount_spacer() {
	difference() {
		cylinder(r=25, h=1.25, $fn=50, center=true);
		m6_hole();
	}
}

mount_spacer();
