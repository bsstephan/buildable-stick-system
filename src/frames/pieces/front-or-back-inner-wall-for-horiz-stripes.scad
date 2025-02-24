/* The inner top/bottom wall of the frame, for being displayed through a horizontal stripe windowed part.
 *
 * SPDX-FileCopyrightText: © 2025 Brian S. Stephan <bss@incorporeal.org>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

include <parameters.scad>
include <components.scad>
use <front-or-back-inner-wall.scad>
use <front-or-back-longish.scad>
use <front-or-back-windowed-horiz-stripes.scad>

// for stability's sake, this piece juts out a bit from the outside of the wall, so we
// need to hack the window piece a bit to subtract from the longer and get ours longer
module horiz_striped_windowed_front_or_back_frame_piece() {
	difference() {
		front_or_back_longish_frame_piece();
		// subtract frame wall windows
		front_horiz_stripes();
		// subtract the inner wall area that will be provided by the other piece
		front_or_back_inner_wall_frame_piece();
	}
}

module front_or_back_windowed_horiz_stripes_inner_wall_frame_piece() {
	difference() {
		front_or_back_longish_frame_piece();
		horiz_striped_windowed_front_or_back_frame_piece();
	}
}

front_or_back_windowed_horiz_stripes_inner_wall_frame_piece();
