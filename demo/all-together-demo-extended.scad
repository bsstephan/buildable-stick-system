/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <../src/parameters.scad>
include <../src/components.scad>
use <../src/frame-piece-top-or-bottom-extended.scad>
use <../src/frame-piece-side-extended-to-bottom.scad>
use <../src/frame-piece-top-or-bottom-for-extended-side-aux-and-neutrik.scad>
use <../src/top-panel-inset-lever-and-dir_arc-plus-w-30mm.scad>
use <../src/top-panel-inset-sega-2p-plus-one-plus-control-with-mount.scad>
use <../src/misc-decorative-plate-24mm-button.scad>
use <../src/misc-decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-plus-one.scad>
use <../src/misc-decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-plus-one-plates.scad>
use <../src/misc-dustwasher-lsx-nobi.scad>

/* top_panel_color        = "white"; */
/* bottom_panel_color     = "red"; */
/* frame_top_bottom_color = "red"; */
/* frame_side_color       = "red"; */
/* top_deco_color         = "black"; */
top_panel_color        = "#5B6579";
bottom_panel_color     = "#8E9089";
frame_top_bottom_color = "#8E9089";
frame_side_color       = "#8E9089";
top_deco_color         = "#8E9089";

color(top_panel_color) translate([-panel_x/2, 0, frame_z/2-panel_z+0.01]) top_panel_inset_lever_and_dir_arc_w_30mm();
color(top_panel_color) translate([panel_x/2, 0, frame_z/2-panel_z+0.01]) top_panel_inset_sega_2p_plus_one_plus_control_with_mount();
color(frame_side_color) translate([-frame_x/2+4, 0, -2.5]) extra_extended_left_or_right_frame_piece();
color(frame_side_color) translate([frame_x/2-4, 0, -2.5]) mirror([1, 0, 0]) extra_extended_left_or_right_frame_piece();
color(frame_top_bottom_color) translate([-frame_x/2+4, 0, -2.5])  extended_top_or_bottom_frame_piece();
color(frame_top_bottom_color) translate([frame_x/2-4, 0, -2.5])  extended_top_or_bottom_frame_piece();
color(frame_top_bottom_color) translate([-frame_x/2+4, 0, -2.5]) rotate([180, 0, 0]) top_or_bottom_aux_and_neutrik_box_frame_piece_for_extended_side();
color(frame_top_bottom_color) translate([frame_x/2-4, 0, -2.5]) rotate([180, 180, 0]) top_or_bottom_aux_and_neutrik_box_frame_piece_for_extended_side();
color(bottom_panel_color) translate([-panel_x/2, 0, -5-frame_z/2+5]) bottom_panel();
color(bottom_panel_color) translate([panel_x/2, 0, -5-frame_z/2+5]) bottom_panel();

/* color(top_deco_color) translate([0, 0, 3+frame_z/2-4]) dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate_of_plates(); */
color(top_deco_color) translate([0, 0, 3+frame_z/2-panel_z]) dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate();
color(top_deco_color) translate([-170, 20, 3+frame_z/2-panel_z]) lsx_nobi_dustwasher();
color(top_deco_color) translate([panel_x-24, 30, 3+frame_z/2-panel_z]) button_24mm_decorative_plate();
