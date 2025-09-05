/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/side-trapezoid-extended-to-front-trapezoid.scad>
use <frames/pieces/front-or-back-trapezoid.scad>
use <frames/pieces/front-or-back-aux-and-neutrik.scad>
use <panels/inset/lever-and-ergo-wasd-five-panel-with-oled.scad>
use <panels/inset/ergo-nine-plus-aux-button-with-mount.scad>
use <misc/decorative-plate-24mm-button.scad>
use <misc/decorative-plate-ergo-wasd-five-30mm-and-ergo-nine-30mm.scad>
use <misc/dustwasher-lsx-nobi.scad>

top_panel_color        = "#0086D6";
bottom_panel_color     = "white";
frame_front_color      = "white";
frame_back_color       = "white";
frame_side_color       = "yellow";
top_deco_color         = "white";

color(top_panel_color) translate([-panel_x/2, 0, frame_z/2-panel_z/2+0.001]) lever_and_ergo_wasd_five_panel_with_oled();
color(top_panel_color) translate([panel_x/2, 0, frame_z/2-panel_z/2+0.001]) ergo_nine_plus_aux_button_panel_with_mount();
color(frame_side_color) translate([-frame_x/2+4, 0, 0]) side_trapezoid_extended_to_front_frame_piece();
color(frame_side_color) translate([frame_x/2-4, 0, 0]) mirror([1, 0, 0]) side_trapezoid_extended_to_front_frame_piece();
color(frame_front_color) translate([-frame_x/2+4, 0, 0])  front_or_back_trapezoid_frame_piece();
color(frame_front_color) translate([frame_x/2-4, 0, 0])  front_or_back_trapezoid_frame_piece();
color(frame_back_color) translate([-frame_x/2+4, 0, 0]) rotate([180, 0, 0]) front_or_back_aux_and_neutrik_frame_piece();
color(frame_back_color) translate([frame_x/2-4, 0, 0]) rotate([180, 180, 0]) front_or_back_aux_and_neutrik_frame_piece();
/* color(bottom_panel_color) translate([-panel_x/2, 0, -5-frame_z/2+5]) panel(); */
/* color(bottom_panel_color) translate([panel_x/2, 0, -5-frame_z/2+5]) panel(); */

color(top_deco_color) translate([0, 0, 4+frame_z/2-panel_z/2+0.001]) ergo_wasd_five_30mm_and_ergo_nine_30mm_decorative_plate();
color(top_deco_color) translate([-170, 25, 4+frame_z/2-panel_z/2+0.001]) lsx_nobi_dustwasher();
color(top_deco_color) translate([panel_x-24, 30, 4+frame_z/2-panel_z/2+0.001]) button_24mm_decorative_plate();
