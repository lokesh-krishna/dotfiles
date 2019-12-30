#!/bin/sh

i3lock -n -e                    \
    --linecolor=00000000        \
    --keyhlcolor=5e81acff       \
    --bshlcolor=bf616aff	\
    --separatorcolor=00000000   \
    --radius=75			\
    --ring-width=5		\
    --indpos="1800:940"		\
    \
    --insidevercolor=00000000	\
    --insidewrongcolor=00000000 \
    --insidecolor=00000000	\
    \
    --ringcolor=88c0d0ff        \
    --ringvercolor=a3be8cff     \
    --ringwrongcolor=bf616aff   \
    \
    --clock			\
    --timecolor=eceff4ff	\
    --timestr="%H:%M"		\
    --time-font=Hack		\
    --timesize=100		\
    --time-align=1		\
    --timepos="50:950"		\
    \
    --datecolor=d8dee9ff	\
    --datestr="%A, %d %B"	\
    --date-font=Hack		\
    --datesize=40		\
    --datepos="50:1000"	\
    --date-align=1		\
    \
    --veriftext=""		\
    --wrongtext=""		\
    \
    --indicator			\
    --image=/home/loki/pictures/wallpapers/blurry-nord.png
