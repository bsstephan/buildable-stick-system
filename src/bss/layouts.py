"""Button and other component layouts for use in panels.

SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
SPDX-License-Identifier: GPL-3.0-or-later
"""
import build123d as bd

from bss import core

####################
# collected points and related data, to be used to construct a layout
####################

# 3x3, centered on top left (P1) button
SEGA_2P_SIX_BUTTON = {'radius': core.BUTTON_30MM_RADIUS,
                      'positions': [(0, 0), (30.5, 11 + 9), (30.5 + 36, 11 + 9),
                                    (0, -19 - 9 - 11), (30.5, -19), (30.5 + 36, -19)]}

####################
# Layouts are Locations with extra stuff to document what it is
####################


class Layout(bd.Locations):
    """A set of button positions that can be adjusted relative to some parameters."""

    def __init__(self, layout, *args, distance_scale=1.00, **kwargs):
        """Lay out the points for the buttons, etc. but can be scaled."""
        self.points = list(map(lambda x: (x[0] * distance_scale, x[1] * distance_scale), layout['positions']))
        self.button_radius = layout['radius']
        super().__init__(self.points, *args, **kwargs)
