/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module sanwa_seimitsu_lever_mount() {
	difference() {
		levermountbase();
		levermountholes();
	}
}

sanwa_seimitsu_lever_mount();
