/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/front-or-back-trapezoid.scad>
use <frames/pieces/side-trapezoid-extended-to-front-trapezoid.scad>
use <frames/pieces/front-or-back-aux-and-neutrik.scad>
use <panels/inset/lever-and-dir_arc-plus-w-30mm-panel.scad>
use <panels/inset/lever-and-sega-2p-6-button-panel-with-aux-with-mount.scad>
use <misc/dustwasher-jlf.scad>

top_panel_color        = "#5B6579";
bottom_panel_color     = "#8E9089";
frame_top_bottom_color = "#8E9089";
frame_side_color       = "#8E9089";
top_deco_color         = "#000000";

color(top_panel_color) translate([0, 0, frame_z/2-panel_z+0.01]) lever_and_sega_2p_6_button_panel_with_aux_with_mount();
color(frame_side_color) translate([0, 0, -2.5]) side_trapezoid_extended_to_front_frame_piece();
color(frame_side_color) translate([0, 0, -2.5]) mirror([1, 0, 0]) side_trapezoid_extended_to_front_frame_piece();
color(frame_top_bottom_color) translate([0, 0, -2.5])  front_or_back_trapezoid_frame_piece();
color(frame_top_bottom_color) translate([0, 0, -2.5]) rotate([180, 0, 0]) front_or_back_aux_and_neutrik_frame_piece();
color(bottom_panel_color) translate([0, 0, -5-frame_z/2+5]) panel();

color(top_deco_color) translate([-65, 5, 3+frame_z/2-panel_z]) jlf_dustwasher();
