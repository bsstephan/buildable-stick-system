# CHANGELOG

Included is a summary of changes to the project, by version. Details can be found in the commit history.

## v4.4.2

### Bugfixes

* Fix a regression with the small button screw-in space cutting into the frame wall supports. The screw-in space is
  potentially more important for some nuts than the thickness of the frame wall supports, so the latter have been
  thinned slightly.

## v4.4.1

### Features

* A new lever + Sega 2P 6 button panel has been added. The overhang version hadn't been updated in forever, but the
  inset panel moved stuff around in a way that allowed a couple aux buttons to fit in, so those have been added to the
  overhang panel as well.
* A horizontal stripe frame windowed piece has been added. YMMV may vary a bit on this vs. an empty window --- you can
  see less of the inner object with the stripes, but it's a bit more stable.

### Improvements

* The frame wall slashes have been made a bit more reusable.
* The area around button holes for screw-ins has been tweaked to be a bit smaller for 30mm buttons and a bit larger for
  24mm buttons.

### Miscellaneous

* A bottom overhang panel was positioned incorrectly in the demo file; this has been fixed.
* Added a demo of the one-panel overhang lever + 6 button stick.

## v4.4.0

### Features

* New "windowed" frame box walls have been added, which allow for seeing through the outer wall to something else, such
  as an inner wall of a different color, or for people who like showing off their wiring, nothing.
* An attempt at a two-panel "shiokenstar" layout has been added.
* The "plates" decorative plate for my favorite layout was altered since I wasn't using it anyway.

### Improvements

* The frame routing hole, in either the whole frames or the interconnect, is a semicircle on one side, making it easier
  to wire (and rewire) a completed arcade stick, and it also makes button layouts that span the connection point more
  possible.
* Less of the inner wall is cut out for e.g. Neutrik and aux buttons now, removing the possibility for inset panels to
  allow for a tiny bit of light to seep the cracks and giving panels a bit more support.
* The piece-based frame walls now meet at 45 degree angles at the corners, which makes for fewer print anomalies to
  catch your hand or clothing on. These 45 degree angles are not used for the TE1-style extended panels, which still
  meet at 90 degree angles.
* All of the core arcade stick parts, and extras, have been reorganized and renamed into subdirectories that make their
  purpose more obvious. This also makes it clearer what you're looking at when looking at the project file structure.
  Documentation was updated throughout for this change.

### Miscellaneous

* A stand for showing off inset-based sticks has been added to extras. This may get more love in a future release.
* The blown up demo now uses frame pieces, as these are quickly becoming the standard build.
* Cleanups to CONTRIBUTING.md
* Demos have been given their own place in the repository.
* The Makefile has been altered to use a Python script to build the files, due to the complexity of reorganizing the
  project into subdirectories.
* An abandoned floating stand has been moved into the attic --- it barely works right.

## v4.3.x

This finally removed the posts added to the panels introduced in v4.0.

## v4.2.x

This added TE1-like bevels to the repository, which look pretty neat.

## v4.1.0

Having improved the internals in v4.0.0, this broke out the frame into modular pieces, making them easier and more
reliable to print, with only a trivial effect on the overall stability of the stick. This also made the bottom panels
identical to the top, easing reuse.

## v4.0.x

This was an experiment that didn't survive scrutiny to add more posts to the frames and panels, in order to improve the
friction fit, but it really just make the whole thing more obnoxious to work with. However, this redesign also came with
some key improvements to the construction of the stick, which has made the subsequent releases easier to work with.

## v3.3.x

Largely a cleanup, this improved the component reuse and added more complete licensing information to the project.

## v3.2.x

This improved the frame height to accommodate more levers in inset panels, along with some cleanup.

## v3.1.x

This added panels for more layouts with more buttons, establishing my go-to of a lever, a directional arc with an extra
button in a W-as-in-WASD position, and a Sega 2P-inspired 9-button action button layout.

## v3.0.x

I think the project really took shape at this point, as it resized the panels and frames to accommodate a two-panel
layout for nice, long sticks.

## v2.0.x

This added the overhang plates to the mix, while still sticking to the three-panel design. It also started adding
dustwashers and decorative plates, which improved the aesthetics of the project.

## v1.0.x

This was a simple three-panel stick that was somewhat ridiculously long, but worked, and built a lot of the foundation
for the project. Its start as being inspired by the Open Stick really showed at this point, but things were coming
together.
