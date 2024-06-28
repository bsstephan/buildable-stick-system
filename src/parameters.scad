/*
 * SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

// adjustments
hole_tolerance = 0.15;

// M2
m2_screw_selftap_radius = 0.95;

// M3
m3_screw_selftap_radius = 1.3;

// M4
m4_bolt_radius = 2 + hole_tolerance;
m4_bolt_countersink_radius = 6.1 + hole_tolerance;
m4_bolt_hex_exterior_radius = 3.6 + hole_tolerance;

// 24mm button
small_button_radius = 12 + hole_tolerance;

// 30mm button
big_button_radius = 15 + hole_tolerance;

// JLF mount dimensions
lever_mount_x = 53;
lever_mount_y = 95;
lever_mount_z = 2;

// standard lever hole
lever_plate_hole = 12;

// case dimensions
// base frame box. reminder: top of inside (including mounts) is chopped by panel_z for plates
frame_x = 233;
frame_y = 208;
frame_z = 57;

// stand dimensions to display a stick
stand_x = 5;
stand_y = frame_z;
stand_z = 15;

// degree to which the extended frame pieces stick out from the end of the frame
frame_extension_x = 25;
frame_extension_y = 25;

// this sinks the bottom and top of the frame inward a bit, and is used to math out two shapes
// when creating the frame box / overhang panel
frame_bevel_height = 2;
overhang_panel_bevel_height = 1;

frame_center_to_neutrik = 70;

// depth of the "lip" of the frame that the top plate sets into/supports the overhang
frame_wall = 4;

// width of the column in the frame corners to support the hex bolt
frame_mount_column_width = 20;

// per neutrik (mm)
neutrik_panel_thickness = 3;

// top plate, which can either be the whole plate ("inset") or the mounting frame for a plate that overhangs
panel_x = frame_x - (frame_wall * 2);
panel_y = frame_y - (frame_wall * 2);
panel_z = 5;

// inside the frame
inner_frame_z = frame_z - (panel_z * 2);

// how much the top plate x/y is expanded to overhang the frame
// note that this is relative to the top plate (so the wall is added back)
panel_overhang_amount = 8.5;
overhang_panel_x = panel_x + (frame_wall * 2) + (panel_overhang_amount * 2);
overhang_panel_y = panel_y + (frame_wall * 2) + (panel_overhang_amount * 2);

panel_to_frame_point_x = (panel_x/2)-10;
panel_to_frame_point_y = (panel_y/2)-10;

// frame interior that supports the top plates
panel_support_width = 5;

// neutrik D screw holes
neutrik_d_screw_radius = 1.6 + hole_tolerance;
neutrik_d_radius = 12 + hole_tolerance;

// additional button radius for decorative panels, etc.
decorative_radius_scale = 1.75;
jumbo_decorative_radius_scale = 2;

// decorative slash parameters
slash_inner_displacement = 10;
slash_width = 15;
slash_height = frame_z-panel_z*3;
