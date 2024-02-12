/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>

module inset_bottom_panel() {
	mirror([0, 0, 1]) bottom_panel();
}

inset_bottom_panel();
