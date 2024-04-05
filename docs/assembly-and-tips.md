# Assembly and Tips

Just some miscellaneous notes for any dear reader, or more likely, my own forgetful self.

## Putting a BSS Stick Together

Assembly of a stick is pretty straightforward, but there are some choices that can make it easier or harder. The
following is the most consistent way I've found to put one together. This is assuming a v4.2 or beyond stick, with two
panels to make a long standard stick, and the frame made of pieces.

1. Prepare the frame top pieces --- `frame-piece-top-left-or-right`: this is your best shot to get auxillary buttons,
   panel connectors, and the like installed, so do it now, and give them a good tighten. You shouldn't need to adjust
   these again, so finish their installation while the pieces are free.
    1. This of course includes decorative plates --- e.g. `misc-decorative-plate-aux-control-three-button-cluster` ---
       you may choose to use. These are held to the top pieces by the buttons or component mounting screws.
2. Start the top panels --- `top-panel-(inset|overhang)-*`: you want both to get the components installed now
   when it's easy, and to make sure that the overall assembly works with your components, so again get your buttons,
   lever, etc., in place. You can secure them at this point.
    1. If you are using a button decorative plate that spans two panels --- e.g.
       `src/misc-decorative-plate-dir_arc-plus-w-30mm-and-sega-2p-plus-one` --- take care to align the two panels as
       tightly as possible, and accurately, as they will be hard to adjust once everything is secured and in the frame.
    2. If using a lever, don't forget the lever mount spacer --- `src/misc-lever-mount-sanwa-seimitsu` --- if you want
       it, and tighten those mounting bolts now as well.
3. Create the frame box by combining your `frame-piece-*` parts together. This will be relatively stable just via
   friction fit.
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

## Removing Inset Panels

As of v4.1 (or in v3), the top and bottom inset panels both insert into the frame, inside the frame "lip", meaning that
when everything is put together, they create a flush surface (more or less). This can make them hard to get out, as you
can't grab anything to get any leverage, and especially with v4.1, the plastic posts to aid the friction fit make it
even harder to muscle out --- in fact, even if you could get an edge and start yanking, you'd probably just break some
of the plastic.

You can instead use the reverse side and the hex standoffs to push a panel out, as so:

1. Loosen, or completely remove, the hex bolts for the panel you would like to remove.
2. Flip the stick over, and remove the hex bolts on the opposite side.
3. Screw in longer bolts, or anything else that'll fit into the hole without going flush against the panel.
4. Push the long bolts in, thus pushing the standoffs, thus pushing the desired panel out from within.
5. You may have to even get a mallet and tap on a bolt, occasionally, as everything can be *pretty* tight.
