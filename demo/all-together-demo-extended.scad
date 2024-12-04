/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/extended/front-or-back.scad>
use <frames/pieces/extended/side-trapezoid-extended-to-front.scad>
use <frames/pieces/extended/front-or-back-clean-for-extended-side-aux-and-neutrik.scad>
use <panels/inset/lever-and-dir_arc-plus-w-30mm-panel.scad>
use <panels/inset/sega-2p-nine-plus-control-panel-with-mount.scad>
use <misc/decorative-plate-24mm-button.scad>
use <misc/decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-nine.scad>
use <misc/dustwasher-lsx-nobi.scad>

top_panel_color        = "#5B6579";
bottom_panel_color     = "#8E9089";
frame_top_bottom_color = "#8E9089";
frame_side_color       = "#8E9089";
top_deco_color         = "#8E9089";

color(top_panel_color) translate([-panel_x/2, 0, frame_z/2-panel_z+0.01]) lever_and_dir_arc_w_30mm_panel();
color(top_panel_color) translate([panel_x/2, 0, frame_z/2-panel_z+0.01]) sega_2p_nine_plus_control_panel_with_mount();
color(frame_side_color) translate([-frame_x/2+4, 0, -2.5]) side_trapezoid_extended_to_front_frame_piece();
color(frame_side_color) translate([frame_x/2-4, 0, -2.5]) mirror([1, 0, 0]) side_trapezoid_extended_to_front_frame_piece();
color(frame_top_bottom_color) translate([-frame_x/2+4, 0, -2.5])  extended_front_or_back_frame_piece();
color(frame_top_bottom_color) translate([frame_x/2-4, 0, -2.5])  extended_front_or_back_frame_piece();
color(frame_top_bottom_color) translate([-frame_x/2+4, 0, -2.5]) rotate([180, 0, 0]) front_or_back_aux_and_neutrik_box_frame_piece_for_extended_side();
color(frame_top_bottom_color) translate([frame_x/2-4, 0, -2.5]) rotate([180, 180, 0]) front_or_back_aux_and_neutrik_box_frame_piece_for_extended_side();
color(bottom_panel_color) translate([-panel_x/2, 0, -5-frame_z/2+5]) panel();
color(bottom_panel_color) translate([panel_x/2, 0, -5-frame_z/2+5]) panel();

color(top_deco_color) translate([0, 0, 3+frame_z/2-panel_z]) dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_plate();
color(top_deco_color) translate([-170, 20, 3+frame_z/2-panel_z]) lsx_nobi_dustwasher();
color(top_deco_color) translate([panel_x-24, 30, 3+frame_z/2-panel_z]) button_24mm_decorative_plate();
