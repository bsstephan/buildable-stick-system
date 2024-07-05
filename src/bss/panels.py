"""The base panel from which all other panels inherit.

SPDX-FileCopyrightText: © 2023 Brian S. Stephan <bss@incorporeal.org>
SPDX-License-Identifier: GPL-3.0-or-later
"""
import logging

import build123d as bd

from bss import core, layouts

logger = logging.getLogger(__name__)


class Panel(bd.BasePartObject):
    """A panel meant to be secured to the top or bottom of a base.

    This is a hard box by default as an inset panel will be flush with the frame.
    """

    def __init__(self, *args, **kwargs):
        """Create our part."""
        with bd.BuildPart() as panel:
            bd.Box(core.PANEL_X, core.PANEL_Y, core.PANEL_Z)
            logger.info(panel.faces().sort_by(bd.Axis.Z))
            with bd.Locations(panel.faces().sort_by(bd.Axis.Z)[-1]):
                with bd.Locations((core.PANEL_TO_FRAME_POINT_X, core.PANEL_TO_FRAME_POINT_Y),
                                  (-core.PANEL_TO_FRAME_POINT_X, core.PANEL_TO_FRAME_POINT_Y),
                                  (-core.PANEL_TO_FRAME_POINT_X, -core.PANEL_TO_FRAME_POINT_Y),
                                  (core.PANEL_TO_FRAME_POINT_X, -core.PANEL_TO_FRAME_POINT_Y)):
                    bd.CounterSinkHole(core.M4_BOLT_RADIUS, core.M4_BOLT_COUNTERSINK_RADIUS)
        super().__init__(panel.part, *args, **kwargs)


with bd.BuildPart() as sega_2p_panel:
    panel = Panel()
    with layouts.Layout(layouts.SEGA_2P_SIX_BUTTON):
        with bd.Locations((5, 45)):
            with bd.Locations(panel.faces().sort_by(bd.Axis.Z)[0]):
                core.CutoutButtonHole(layouts.SEGA_2P_SIX_BUTTON['radius'])

try:
    show_object(sega_2p_panel)
except NameError:
    pass
