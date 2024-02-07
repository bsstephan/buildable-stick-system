/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <top-panel-right-sega-2p-plus-one-plus-control-with-mount.scad>

module top_panel_right_sega_2p_plus_one_plus_control_with_mount_with_oled() {
	difference() {
		top_panel_right_sega_2p_plus_one_plus_control_with_mount();
		translate([75, 77.5, 0]) oled_ssd1306_mount_cutout();
	}
	translate([75, 77.5, 0.5]) oled_ssd1306_mount();
}

top_panel_right_sega_2p_plus_one_plus_control_with_mount_with_oled();
