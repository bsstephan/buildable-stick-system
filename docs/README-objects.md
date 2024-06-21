# The Buildable Stick System

Files for 3D printing an arcade stick.

## Objects

The following notes document the objects in the Buildable Stick System and how you can use them:

* `frames/`
    * `complete/` --- these are the four walls of the frame as one piece, in a couple variations for combining into
      larger arcade sticks. They are simple to assemble, but you have fewer modularity/customization options, and they
      are harder to print because the physics of the material cooling will probably pull the corners up. They also need
      supports, since the face and back of the frame both have trays for panels to go into. Use at your own risk.
    * `pieces/`
        * `box/` --- these are the same four walls (generally speaking) as in the complete frames above, broken out into
          modular faces to print separately. Because they are separate pieces, you can mix and match colors, and you can
          lay them all face down on the print surface for better adhesion and surface patterns. There are also variants
          here, the "windowed" pieces, for doing two-tone variants and that kind of thing.
        * `extended/` --- the frame walls are pulled out to create MCZ TE-style extended sides/bottom. Rather than
          getting a box look, you get a longer slab with nice bevels. These look nice, but slightly fiddily to print
          (and of course need more material) --- watch your surface adhesion.
        * `interconnect` --- complete frames are bolted to one another, but for frame pieces, there is an interconnect
          that stands in for the joined inner wall. You need this if you are combining multiple sets of walls, e.g. for
          a two-panel-long stick.
* `panels/`
    * `inset/` --- various panels, all of the same size, that fit into and flush with the frame, making the arcade stick
      face or back. These work equally well with box or extended frames, and aside from using up a bit of the space
      inside the frame, come with no downsides --- they print easily and are a pretty simple shape to tweak and remix.
    * `overhang/` --- overhang panels have their face extending over the edge of the frame, creating a bit of a sandwich
      look. This is mostly an aesthetic choice, but they sit higher in the frame as well, the main panel being
      over/under the frame rather than within it. This extra space is useful for taller levers. The only downside to
      these is that they aren't as reusable as the inset panels, since the inset panels can go anywhere, but the
      overhang panels must be designed to not overlap with other overhang panels, so you might have to make more custom
      variants depending on where you put things.
* `misc/`
    * Pieces that I haven't organized better (yet) --- there are decorative plates for face buttons or top buttons to
      give more color variance and some layers to the arcade stick, some very simple dustwashers, plates that fit rocker
      switches and the like in Neutrik D or 20mm holes, and a lever mount spacer for getting your lever shaft at the
      desired height. You don't *need* any of these, but you'll probably use a few.
* `extras/`
    * Various experiments and things not directly related to making an arcade stick. At time of writing, there's a
      couple pieces for a little stand for the stick, solely for vanity purposes.

Feel free to request or contribute to more objects, see the links to Git repos below.

## Printing and Assembling

Additional documentation regarding printing the objects and assembling the stick are available in
`docs/printing-and-materials.md` and `docs/assembly-and-tips.md`, respectively.

## Author and Licensing

Written by and copyright Brian S. Stephan (<bss@incorporeal.org>).

These arcade stick parts are from the Buildable Stick System; the source code to this program is available under the
terms of the GNU General Public License, at:

* <https://github.com/bsstephan/buildable-stick-system>, or
* <https://git.incorporeal.org/bss/buildable-stick-system>

See the tags/releases for the version of the source code corresponding to the STLs you received.

The Buildable Stick System is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any
later version.

The Buildable Stick System is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with the Buildable Stick System. If not, see
<https://www.gnu.org/licenses/>.

## Lineage

Inspired by the incredible work of [TheTrain](https://github.com/TheTrainGoes) on the [OpenStickCommunity Fightstick
Case](https://github.com/OpenStickCommunity/Hardware/tree/main/Fightstick%20Case), itself based on the incredible work
by [Dash n'Mash](https://twitter.com/Dash_xx_Mash?s=20). Original work Copyright 2023 TheTrain, [licensed under CC BY
4.0](https://creativecommons.org/licenses/by/4.0/).
