# Printing and Materials

bss's random thoughts and notes on the actual printing of the Buildable Stick System.

## Printing Settings

My preferred settings are 3 wall loops with 20% gyroid sparse infill. This gives the models a bit more weight and
strength against bowing forces, but something more default, like 2 wall loops, 15% grid sparse infill, is fine and does
not lead to a weak enclosure.

### Working With Flatness

A lot of the pieces are long and flat, so I recommend really dialing in your printer settings. The frame pieces make
corner curling of the frame less of a problem, but you may still get it on the panels and the beveled frame pieces.

Another thing to consider, in my experience, is the bottom layer pattern. Monotonic prints fast but creates long,
uniform lines that create reflection patterns on long, flat surfaces. This can be especially distracting for the top
panels, since they're what you're looking at 90% of the time. Using a non-uniform pattern, like hilbert curve,
eliminates this problem, but at the expense of a much longer print --- around an hour longer for an inset panel. Other
patterns may improve beyond monotonic, but hilbert curve seems to be the gold standard.

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
