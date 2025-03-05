/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/side.scad>
use <frames/pieces/front-or-back.scad>
use <frames/pieces/front-or-back-aux-and-neutrik.scad>
use <panels/inset/lever-and-dir_arc-plus-w-30mm-panel.scad>
use <panels/inset/sega-2p-nine-plus-control-panel-with-mount.scad>
use <misc/decorative-plate-24mm-button.scad>
use <misc/decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-nine.scad>
use <misc/dustwasher-lsx-nobi.scad>

panel_color    = "red";
base_color     = "gray";
top_deco_color = "white";

color(panel_color) translate([-panel_x/2, 0, frame_z/2-panel_z+0.01]) lever_and_dir_arc_w_30mm_panel();
color(panel_color) translate([panel_x/2, 0, frame_z/2-panel_z+0.01]) sega_2p_nine_plus_control_panel_with_mount();
color(base_color) translate([panel_x/2, 0, -2.5]) rotate([0, 180, 0]) side_frame_piece();
color(base_color) translate([-panel_x/2, 0, -2.5]) side_frame_piece();
color(base_color) translate([panel_x/2, 0, -2.5]) front_or_back_frame_piece();
color(base_color) translate([-panel_x/2, 0, -2.5]) front_or_back_frame_piece();
color(base_color) translate([panel_x/2, 0, -2.5]) rotate([180, 180, 0]) front_or_back_aux_and_neutrik_frame_piece();
color(base_color) translate([-panel_x/2, 0, -2.5]) rotate([180, 0, 0]) front_or_back_aux_and_neutrik_frame_piece();
color(base_color) translate([-panel_x/2, 0, -5-frame_z/2+5]) panel();
color(base_color) translate([panel_x/2, 0, -5-frame_z/2+5]) panel();

color(top_deco_color) translate([0, 0, 3+frame_z/2-panel_z]) dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_plate();
color(top_deco_color) translate([-170, 20, 3+frame_z/2-panel_z]) lsx_nobi_dustwasher();
color(top_deco_color) translate([panel_x-24, 30, 3+frame_z/2-panel_z]) button_24mm_decorative_plate();
