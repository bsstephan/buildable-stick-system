/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <misc-neutrik-d-plate.scad>

module neutrik_d_plate_24mm() {
	difference() {
		neutrik_d_plate();
		neutrik_d_mount();
	}
}

neutrik_d_plate_24mm();
