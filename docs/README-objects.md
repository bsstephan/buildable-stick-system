# The Buildable Stick System

Files for 3D printing an arcade stick.

## Objects

The following notes document the objects in the Buildable Stick System and how you can use them:

* `bottom-panel-inset`: a simple solid panel that fits into the bottom of a frame box.
* `bottom-panel-overhang-*`: solid panels whose base fits into the bottom of a frame box, but have a longer sheet that
  extends beyond the frame, creating a sandwich kind of look; the various forms hang over more or less of the frame,
  expecting it will be connected to other frames.
* `frame-{left,middle,right,solo}`: the core frame of the stick, these are complete boxes; since they are long and
  narrow, and need supports to print the space for the insets, these may be difficult to print nicely.
* `frame-piece-*`: the core frame broken up by individual faces, which are easier to print and essentially just as
  sturdy.
* `frame-piece-*-extended*`: frame pieces that have been stretched out beyond the normal frame dimensions in order to
  make a nice bevel on the sides and/or bottom; this, interestingly, tends to make the stick look a bit thinner than if
  it was just a simple box.
* `misc-decorative-plate-*`: things you can print to snazz up face buttons mounting, auxillary button points, etc..
* `misc-dustwasher-*`: simple dustwashers for levers.
* `misc-lever-mount-*`: lever mounts of various shapes and depths to get the desired lever height when mounting a lever
  to a panel (with the appropriate cutouts).
* `misc-neutrik-*`: like the decorative plates, but these are a bit more necessary by their design.
* `misc-rocker-*`: rocker SPDT switches don't have mounting holes, this allows you to attach them to the frame.
* `top-panel-inset-*`: various lever and/or button layouts for using as the face(s) of a stick.
* `top-panel-overhang-`: same idea as the inset top panels, but overhung over the frame to make the sandwich look; these
  also leave a bit more space inside the frame, which might accommodate a taller lever.

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
