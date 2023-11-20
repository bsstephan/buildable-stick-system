/* Copyright Brian Stephan 2023
 *
 * This file is part of the Buildable Stick System.
 *
 * The Buildable Stick System is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 *
 * The Buildable Stick System is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * the Buildable Stick System. If not, see <https://www.gnu.org/licenses/>.
 */

include <parameters.scad>
include <components.scad>
use <frame-left.scad>
use <frame-right.scad>
use <top-panel-left-lever-and-dir_arc-plus-w-30mm.scad>
use <top-panel-right-sega-2p-plus-one-plus-control-with-mount.scad>
use <bottom-panel-left.scad>
use <bottom-panel-right.scad>
use <misc-decorative-plate-24mm-button.scad>
use <misc-decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-plus-one.scad>
use <misc-dustwasher-lsx-nobi.scad>

color("#C12E1F") translate([-top_plate_x/2-25, 0, frame_z/2+75]) top_panel_left_lever_and_dir_arc_w_30mm();
color("#C12E1F") translate([top_plate_x/2+25, 0, frame_z/2+75]) top_panel_right_sega_2p_plus_one_plus_control_with_mount();
color("black") translate([-frame_x/2+5-25, 0, -2.5]) left_frame();
color("black") translate([frame_x/2+25, 0, -2.5]) right_frame();
color("#C12E1F") translate([-top_plate_x/2-25, 0, -5-frame_z/2-75]) bottom_panel_left();
color("#C12E1F") translate([top_plate_x/2+25, 0, -5-frame_z/2-75]) bottom_panel_right();

color("black") translate([0, 0, 3+frame_z/2+150]) dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate();
color("black") translate([-195, 25, 3+frame_z/2+150]) lsx_nobi_dustwasher();
color("black") translate([top_plate_x, 25, 3+frame_z/2+150]) button_24mm_decorative_plate();
