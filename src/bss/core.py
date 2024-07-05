"""Shared parameters and foundational objects.

Reminder that the default unit is millimeters.

SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
SPDX-License-Identifier: GPL-3.0-or-later
"""
import build123d as bd

####################
# measurements for holes and connectors
####################
HOLE_TOLERANCE = 0.15

M4_BOLT_RADIUS = 2 + HOLE_TOLERANCE
M4_BOLT_COUNTERSINK_RADIUS = M4_BOLT_RADIUS + 2

####################
# basic dimensions necessary for proper object composition
####################

# these are for ONE frame box, not the overall case, which may be composed
# of multiple frames
FRAME_X = 233
FRAME_Y = 208
FRAME_Z = 57

# the "wall" is the space inside the frame that is reserved to make a lip for panels
FRAME_WALL = 4

# panel dimensions for either an inset panel or the inner tray of an overhang panel
PANEL_X = FRAME_X - (FRAME_WALL * 2)
PANEL_Y = FRAME_Y - (FRAME_WALL * 2)
PANEL_Z = 5

# the center point of where the standoff and bolts connecting a panel to a frame go,
# relative to a centered object
PANEL_TO_FRAME_POINT_OFFSET = 10
PANEL_TO_FRAME_POINT_X = (PANEL_X/2) - PANEL_TO_FRAME_POINT_OFFSET
PANEL_TO_FRAME_POINT_Y = (PANEL_Y/2) - PANEL_TO_FRAME_POINT_OFFSET

####################
# commonly used button dimensions
####################

BUTTON_30MM_RADIUS = 15 + HOLE_TOLERANCE
BUTTON_24MM_RADIUS = 12 + HOLE_TOLERANCE

# carve out space for snap-ins
# judgng by https://www.slagcoin.com/joystick/attributes_brands.html 2.5mm is good for everything
BUTTON_SNAP_IN_THICKNESS = 2.5

# make sure the carve out space is also enough for screw-in nuts
# slagcoin has screw-in nut diameter at 36mm for 30mm buttons, 29.5 for 24mm buttons
# radius + value below should leave space for the nut and for fingers to grab the nut
BUTTON_30MM_RADIUS_CONNECTOR_SPACE = 6

####################
# arcade stick parts that are relevant in a number of contexts
####################


class CutoutButtonHole(bd.CounterBoreHole):
    """Use an inverted counter bore hole as the button hole with the extra thin space for snap-ins."""

    def __init__(self, radius, **kwargs):
        """Initialize the inverted counter bore hole with the right thinness for e.g. a panel to take snap-ins."""
        super().__init__(radius, radius+BUTTON_30MM_RADIUS_CONNECTOR_SPACE, BUTTON_SNAP_IN_THICKNESS, **kwargs)
