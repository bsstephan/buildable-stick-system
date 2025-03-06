# Printing and Materials

bss's random thoughts and notes on the actual printing of the Buildable Stick System.

## Printing Settings

My preferred settings are 3 wall loops with 25% gyroid sparse infill. This gives the models a bit more weight and
strength against bowing forces, but something more default, like 2 wall loops, 15% grid sparse infill, is fine and does
not lead to a weak enclosure.

### Supports and Positioning

All of the parts are designed to be printed outside-face-down. The bevels are at an angle (45 degrees) that should print
fine with no supports. Make sure everything is aligned properly on your plate so that the flat face you will look at the
most is on the bottom.

The only exception to this is the interconnect piece(s), which are not visible and need a support to print. Maybe one
day I'll rejigger these.

### Working With Flatness

A lot of the pieces are long and flat, so I recommend really dialing in your printer settings. The frame pieces make
corner curling of the frame less of a problem, but you may still get it on the panels and the beveled frame pieces.

#### Bottom Layer Notes

Considering the visible layer (usually, the bottom layer) pattern is ideal. Monotonic prints fast but creates long,
uniform lines that create reflection patterns on long, flat surfaces. This can be especially distracting for the top
panels and their decorative plates, since they're what you're looking at 90% of the time, and the holes break up a
perfect pattern, making the long lines stand out even more.

Some specific parts are worth some additional notes:

* **Top panels:** using a non-uniform pattern reduces if not eliminates the problem of the surface catching the light,
  but for some patterns, it may come at the expense of time.
    * **Avoid:** monotonic.
    * **Good for the time:** Archimedean chords create the look of a circular ripple radiating out the center, and
      depending on the material, you may not even notice it much, so it's a pretty good look/speed balance.
    * **Great if you can wait:** hilbert curve leaves no discernable pattern on most materials, but some high gloss,
      high contrast materials may show the winding pattern at some angles --- consider Archimedean chords for these.
* **Circle-centric decorative plates:** simple ones could be fine in whatever, but the ones for action buttons end up
  having lots of weird interaction points.
    * **Avoid:** none; monotonic doesn't look *good*, but the plates don't have enough surface area for the pattern to
      stand out too much.
    * **Decent:** concentric is generally good, but you can get some pitting when the pattern radiating away from
      buttons collides with other patterns, because none of the geometry lines up well.
    * **Great:** Archimedean chords, just crank up the infill/wall overlap to avoid pits on the edges.
* **Frame walls with Neutrik or aux button cutouts:** a reduced but similar problem with the action button decorative
  plates, the circles near each other create weird interactions with the walls.
    * **Avoid:** concentric, again, has problems with pitting where geometries clash.
    * **Decent:** monotonic is pretty decent here, and you probably won't look at the sides too much, so maybe it
      doesn't bother you.
    * **Great:** Archimedean chords again, with the same infill/wall overlap as decorative plates.
* **Flush frame walls:** you can pretty much do whatever you like here.
    * **Great:** concentric produces an interesting pattern and you won't have collision problems in a rectangle.
    * **Essentially great:** Archimedean chords yet again, you may just not like the pattern as much as the end result
      of concentric.

The Archimedean chord pattern is a good default and prints awesome parts, with the only exception being the top panels,
which benefit from using a Hilbert curve initial layer pattern instead, though you may be happy enough with Archimedean
chord.

## Materials

Some notes on PLA brands, usages, etc.

### Bambu Lab PLA

#### Basic

* In general, nice texture, but under direct light, you can see a bit of the infill pattern through the walls. Not super
  distracting, but it's there.

##### White

* Walls are practically translucent, you can almost always see the infill. 3 wall loops and a varying infill pattern
  definitely help here.
* Looks perfectly good for thin things like the Neutrik plates, decorative pieces, that kind of thing.

#### Matte

* I don't like the texture as much, but they do produce nice non-primary color colorways, and you don't see the infill.
* Seems like their plastic treatment leaves some plate residue, so be better about cleaning it or you'll get ghosts.

### Hatchbox PLA

* **Blue:** very blue. Wife likes it.
* **White:** more opaque than the Bambu PLA mentioned above, makes a pretty decent (still slightly translucent) frame.
