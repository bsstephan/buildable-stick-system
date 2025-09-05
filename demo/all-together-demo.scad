/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/side.scad>
use <frames/pieces/front-or-back.scad>
use <frames/pieces/front-or-back-aux-and-neutrik.scad>
use <panels/inset/lever-and-ergo-wasd-five-panel-with-oled.scad>
use <panels/inset/ergo-nine-plus-aux-button-with-mount.scad>
use <misc/decorative-plate-24mm-button.scad>
use <misc/decorative-plate-ergo-wasd-five-30mm-and-ergo-nine-30mm.scad>
use <misc/dustwasher-lsx-nobi.scad>

panel_color    = "red";
base_color     = "gray";
top_deco_color = "white";
brace_color    = "gray";

color(panel_color) translate([-panel_x/2, 0, frame_z/2-panel_z/2+0.001]) lever_and_ergo_wasd_five_panel_with_oled();
color(panel_color) translate([panel_x/2, 0, frame_z/2-panel_z/2+0.001]) ergo_nine_plus_aux_button_panel_with_mount();
color(base_color) translate([panel_x/2, 0, 0]) rotate([0, 180, 0]) side_frame_piece();
color(base_color) translate([-panel_x/2, 0, 0]) side_frame_piece();
color(base_color) translate([panel_x/2, 0, 0]) front_or_back_frame_piece();
color(base_color) translate([-panel_x/2, 0, 0]) front_or_back_frame_piece();
color(base_color) translate([panel_x/2, 0, 0]) rotate([180, 180, 0]) front_or_back_aux_and_neutrik_frame_piece();
color(base_color) translate([-panel_x/2, 0, 0]) rotate([180, 0, 0]) front_or_back_aux_and_neutrik_frame_piece();
/* color(base_color) translate([-panel_x/2, 0, -frame_z/2+panel_z/2]) panel(); */
/* color(base_color) translate([panel_x/2, 0, -frame_z/2+panel_z/2]) panel(); */

color(top_deco_color) translate([0, 0, 4+frame_z/2-panel_z/2+0.001]) ergo_wasd_five_30mm_and_ergo_nine_30mm_decorative_plate();
color(top_deco_color) translate([-170, 25, 4+frame_z/2-panel_z/2+0.001]) lsx_nobi_dustwasher();
color(top_deco_color) translate([panel_x-24, 30, 4+frame_z/2-panel_z/2+0.001]) button_24mm_decorative_plate();
