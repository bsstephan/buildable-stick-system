/* The inner side wall of the frame, for being displayed through a horizontal stripe windowed part.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <side-inner-wall.scad>
use <side-longish.scad>
use <side-windowed-horiz-stripes.scad>

// for stability's sake, this piece juts out a bit from the outside of the wall, so we
// need to hack the window piece a bit to subtract from the longer and get ours longer
module horiz_striped_windowed_side_frame_piece() {
	difference() {
		side_longish_frame_piece();
		// subtract frame wall windows
		side_horiz_stripes();
		// subtract the inner wall area that will be provided by the other piece
		side_inner_wall_frame_piece();
	}
}

module side_windowed_horiz_stripes_inner_wall_frame_piece() {
	difference() {
		side_longish_frame_piece();
		horiz_striped_windowed_side_frame_piece();
	}
}

side_windowed_horiz_stripes_inner_wall_frame_piece();
