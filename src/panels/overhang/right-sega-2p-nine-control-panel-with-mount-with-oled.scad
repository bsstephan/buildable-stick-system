/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <right-sega-2p-nine-plus-control-panel-with-mount.scad>

module sega_2p_nine_plus_control_right_overhang_panel_with_mount_with_oled() {
	difference() {
		sega_2p_nine_plus_control_right_overhang_panel_with_mount();
		translate([75, 77.5, 0]) oled_ssd1306_mount_cutout();
	}
	translate([75, 77.5, 0.5]) oled_ssd1306_mount();
}

sega_2p_nine_plus_control_right_overhang_panel_with_mount_with_oled();
