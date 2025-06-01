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
use <panels/inset/sega-2p-nine-plus-aux-button-with-mount.scad>
use <misc/decorative-plate-24mm-button.scad>
use <misc/decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-nine.scad>
use <misc/dustwasher-lsx-nobi.scad>

panel_color    = "red";
base_color     = "gray";
top_deco_color = "white";
brace_color    = "gray";

color(panel_color) translate([-panel_x/2, 0, frame_z/2-panel_z/2+0.001]) lever_and_dir_arc_w_30mm_panel();
color(panel_color) translate([panel_x/2, 0, frame_z/2-panel_z/2+0.001]) sega_2p_nine_plus_aux_button_with_mount();
color(base_color) translate([panel_x/2, 0, 0]) rotate([0, 180, 0]) side_frame_piece();
color(base_color) translate([-panel_x/2, 0, 0]) side_frame_piece();
color(base_color) translate([panel_x/2, 0, 0]) front_or_back_frame_piece();
color(base_color) translate([-panel_x/2, 0, 0]) front_or_back_frame_piece();
color(base_color) translate([panel_x/2, 0, 0]) rotate([180, 180, 0]) front_or_back_aux_and_neutrik_frame_piece();
color(base_color) translate([-panel_x/2, 0, 0]) rotate([180, 0, 0]) front_or_back_aux_and_neutrik_frame_piece();
color(base_color) translate([-panel_x/2, 0, -frame_z/2+panel_z/2]) panel();
color(base_color) translate([panel_x/2, 0, -frame_z/2+panel_z/2]) panel();

color(top_deco_color) translate([0, 0, 4+frame_z/2-panel_z/2+0.001]) dir_arc_plus_w_30mm_and_sega_2p_nine_decorative_plate();
color(top_deco_color) translate([-170, 20, 4+frame_z/2-panel_z/2+0.001]) lsx_nobi_dustwasher();
color(top_deco_color) translate([panel_x-24, 30, 4+frame_z/2-panel_z/2+0.001]) button_24mm_decorative_plate();
