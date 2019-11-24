#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#80808080'  # default
T='#ee00eeee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
--blur 9 \
--indicator

