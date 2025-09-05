/*
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <lever-and-ergo-wasd-five-panel.scad>

module lever_and_ergo_wasd_five_panel_with_oled() {
	difference() {
		lever_and_ergo_wasd_five_panel();
		translate([0, -(panel_y/2 - 22), 0]) adafruit_pid_326_oled_ssd1306_mount_cutout();
	}
	translate([0, -(panel_y/2 - 22), 0]) adafruit_pid_326_oled_ssd1306_mount();
}

lever_and_ergo_wasd_five_panel_with_oled();
