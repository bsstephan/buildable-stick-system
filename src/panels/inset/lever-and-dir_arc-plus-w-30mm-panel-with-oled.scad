/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <lever-and-dir_arc-plus-w-30mm-panel.scad>

module lever_and_dir_arc_w_30mm_panel_with_oled() {
	difference() {
		lever_and_dir_arc_w_30mm_panel();
		translate([0, -(panel_y/2 - 22), 0]) adafruit_pid_326_oled_ssd1306_mount_cutout();
	}
	translate([0, -(panel_y/2 - 22), 0]) adafruit_pid_326_oled_ssd1306_mount();
}

lever_and_dir_arc_w_30mm_panel_with_oled();
