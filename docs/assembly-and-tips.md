# Assembly and Tips

These are the parts you need and instructions for creating a simple two panel arcade stick. The end product is a
rectangular prism roughly 18" long, with ample space for back buttons and enough top panel space for almost any layout
you can imagine. There are more pieces and designs to experiment with, but this will get you an awesome "standard"
build.

## Parts for a Basic Enclosure

The pieces you need to print (all colors to your taste):

* **The base frame:** `frame/pieces/front-or-back.stl` x2 + `frame/pieces/front-or-back-aux-and-neutrik.stl` x2 +
  `frame/pieces/interconnect.stl`. This creates a large "H" with six 24mm button holes and two Neutrik D holes on the
  back, which can mount USB connectors or rocker switches, or be covered if not used. All four of the front or back
  pieces connect to the interconnect piece, which creates one frame out of the individual pieces, and also adds some
  support to the center of the enclosure. The interconnect has a large hole that can either make wire routing easier, or
  leave space in the center for button layouts that span it.
* **The frame sides:** `frame/pieces/side.stl` x2. These cap the "H", completing the overall frame.
* **The top:** `panels/inset/[LAYOUTS].stl`. These panels go on the top of the frame and are where you mount all of your
  main buttons and levers and whatnot. There are a couple layouts whose panels are meant to be paired (e.g.
  `shiokenstar-left-panel.stl` and `shiokenstar-right-panel.stl`), but usually you simply pick a left panel (e.g.
  `lever-panel-with-mount.stl`) and right panel (e.g. `sega-2p-panel.stl`) based on what you want. Note that one of your
  choices should be "with mount", which is where the usually-sized PCB will screw into inside the box.
* **The bottom:** `panels/inset/panel.stl` x2. Other than being the color of your choice, these just close the box.
  You could put foam pads or something on these if you wanted.

The above gets you the basics. Some common things you may also want:

* **Mounting Neutrik connectors:** Neutrik D connectors can mount flush to the inside of the frame, but you can choose
  to have a little decorative plate (`misc/neutrik-d-plate.stl` for added depth or color choices on the outside of the
  frame, if you'd like.
* **Mounting a 24mm switch:** a rocker switch can also be mounted in the Neutrik D connector, but it needs to be placed
  into a `misc/neutrik-d-plate-24mm-hole.stl` plate, and the plate mounted to the frame.
* **Flair for the auxillary buttons:** the three buttons in a row on the back of the frame can also get some style, just
  place a `misc/decorative-plate-aux-control-three-button-cluster.stl` between the buttons and the frame. This only
  works for screw-in buttons.
* **Flair for the top buttons:** same as above, a decorative plate for top panel layouts --- e.g.
  `misc/decorative-plate-sega-2p.stl` --- can be sandwiched between the buttons and panel to add some style. This also
  only tends to work on screw-in buttons.
* **Dustwashers/flair:** same deal, if you want to print one, use e.g. `misc/dustwasher-jlf.stl`.

## Putting a BSS Stick Together

Assembly of a stick is pretty straightforward, but there are some choices that can make it easier or harder. The
following is the most consistent way I've found to put one together.

1. Prepare the frame pieces: this is your best shot to get the e.g. Neutrik plates for the USB mount, SPDT switches, etc.
   installed, so do it now, and give them a good tighten. You shouldn't need to adjust these again, so finish their
   installation while the pieces are free.
    1. You could also do the decorative plates and related buttons, but it might be just as well to leave those for step 7,
       just to make sure the buttons don't get in the way of other buttons or a lever or so on.
2. Start the top panels: you want both to get the components installed now when it's easy, and to make sure that the
   overall assembly works with your components, so again get your buttons, lever, etc., in place. You can secure them at
   this point.
    1. If you are using a button decorative plate that spans two panels --- e.g.
       `misc/decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-plus-one` --- take care to align the two panels as tightly
       as possible, and accurately, as they will be hard to adjust once everything is secured and in the frame.
    2. If using a lever, don't forget the lever mount spacer --- `misc/lever-mount-sanwa-seimitsu` --- if you want it,
       and tighten those mounting bolts now as well.
3. Create the frame box by combining your frame piece parts, box or extended, together. This will be relatively stable
   just via friction fit.
4. Rest the frame top-up on a desk, and put the standoffs through the holes. This will probably be tight, and you may
   even need a rubber mallet or similar to drive the standoffs through the holes.
5. Insert the top panels into the frame.
6. Insert the bolts for the top panels, make any last adjustments, and tighten them.
7. At this point you have an open box with access to all your components. Do all of your wiring.
    1. Tighten the buttons and etc. if you didn't in step 2.
8. Insert the bottom panels into the frame.
9. Insert the bottom bolts for the bottom panels, and tighten them.

In the end, this should be extremely sturdy. None of the frame or panels should be loose at all, and you should be able
to move, flip, gently toss, etc. the stick without anything moving or feeling loose.
