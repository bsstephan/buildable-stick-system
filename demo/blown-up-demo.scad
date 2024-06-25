/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <frames/pieces/interconnect.scad>
use <frames/pieces/box/side.scad>
use <frames/pieces/box/front-or-back.scad>
use <frames/pieces/box/front-or-back-aux-and-neutrik.scad>
use <panels/overhang/left-lever-and-dir_arc-plus-w-30mm-panel.scad>
use <panels/overhang/right-sega-2p-plus-one-plus-control-panel-with-mount.scad>
use <panels/overhang/left-or-right-panel.scad>
use <misc/decorative-plate-24mm-button.scad>
use <misc/decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-plus-one.scad>
use <misc/dustwasher-lsx-nobi.scad>

color("#C12E1F") translate([-panel_x/2-25, 0, frame_z/2+75]) lever_and_dir_arc_w_30mm_left_overhang_panel();
color("#C12E1F") translate([panel_x/2+25, 0, frame_z/2+75]) sega_2p_plus_one_plus_control_right_overhang_panel_with_mount();
color("black") translate([-frame_x/2+5-25, -55, -2.5]) front_or_back_box_frame_piece();
color("black") rotate([0, 180, 0]) translate([-frame_x/2+5-25, -55, -2.5]) front_or_back_box_frame_piece();
color("black") translate([-frame_x/2+5-50, 0, -2.5]) side_box_frame_piece();
color("black") rotate([0, 180, 0]) translate([-frame_x/2+5-50, 0, -2.5]) side_box_frame_piece();
color("black") rotate([180, 0, 0]) translate([-frame_x/2+5-25, -55, -2.5]) front_or_back_aux_and_neutrik_box_frame_piece();
color("black") rotate([180, 0, 0]) rotate([0, 180, 0]) translate([-frame_x/2+5-25, -55, -2.5]) front_or_back_aux_and_neutrik_box_frame_piece();
color("black") rotate([0, 180, 0]) interconnect_frame_piece();
color("#C12E1F") translate([-panel_x/2-25, 0, -5-frame_z/2-75]) left_or_right_overhang_panel();
color("#C12E1F") mirror([0, 1, 0]) translate([panel_x/2+25, 0, -5-frame_z/2-75]) rotate([0, 0, 180])
	left_or_right_overhang_panel();

color("black") translate([0, 0, 3+frame_z/2+150]) dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate();
color("black") translate([-195, 25, 3+frame_z/2+150]) lsx_nobi_dustwasher();
color("black") translate([panel_x, 25, 3+frame_z/2+150]) button_24mm_decorative_plate();
