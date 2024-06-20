/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <neutrik-d-plate.scad>

module rocker_plate_20mm() {
	difference() {
		neutrik_d_plate();
		rocker_20mm_mount();
	}
}

rocker_plate_20mm();
