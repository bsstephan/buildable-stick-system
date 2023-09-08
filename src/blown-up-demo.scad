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

include <components.scad>
use <frame-left.scad>
use <frame-middle.scad>
use <frame-right.scad>
use <top-panel-left-lever.scad>
use <top-panel-middle-dir_arc-plus-w-30mm-with-mount.scad>
use <top-panel-right-sega-2p-plus-one.scad>
use <bottom-panel-left.scad>
use <bottom-panel-middle.scad>
use <bottom-panel-right.scad>
use <misc-decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-plus-one.scad>
use <misc-decorative-plate-dir_arc-plus-w-30mm.scad>
use <misc-decorative-plate-sega-2p-plus-one.scad>
use <misc-dustwasher-lsx-nobi.scad>

color("red") translate([-top_plate_x-50, 20, frame_z/2+100]) top_panel_left_lever();
color("red") translate([0, 0, frame_z/2+100]) top_panel_middle_dir_arc_w_30mm_with_mount();
color("red") translate([top_plate_x+50, 0, frame_z/2+100]) top_panel_right_sega_2p_plus_one();
color("black") translate([-frame_x+10-50, 0, -2.5]) left_frame();
color("black") translate([0, 0, -2.5]) middle_frame();
color("black") translate([frame_x-10+50, 0, -2.5]) right_frame();
color("red") translate([-top_plate_x-50, 0, -5-frame_z/2-100]) bottom_panel_left();
color("red") translate([0, 0, -5-frame_z/2-100]) bottom_panel_middle();
color("red") translate([top_plate_x+50, 0, -5-frame_z/2-100]) bottom_panel_right();

color("black") translate([top_plate_x/2, 0, 3+frame_z/2+150]) dir_arc_plus_w_30mm_and_sega_2p_plus_one_decorative_plate();
color("black") translate([-top_plate_x/2-135, 20, 3+frame_z/2+150]) lsx_nobi_dustwasher();
