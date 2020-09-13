#!/bin/sh
i3lock --nofork                 \
    --ignore-empty-password	\
    --linecolor=00000000        \
    --keyhlcolor=88c0d0ff       \
    --bshlcolor=d8dee9ff	\
    --separatorcolor=00000000   \
    --radius=75			\
    --indpos="1800:950"		\
    \
    --insidevercolor=00000000	\
    --insidewrongcolor=00000000 \
    --insidecolor=00000000	\
    \
    --ringcolor=5e81acff        \
    --ringvercolor=a3be8cff     \
    --ringwrongcolor=bf616aff   \
    \
    --clock			\
    --timecolor=eceff4ff	\
    --timestr="%H:%M"		\
    --time-font='JetBrains Mono Nerd Font'	\
    --timesize=75		\
    --timepos="150:950"		\
    \
    --datecolor=d8dee9ff	\
    --datestr="%A, %d %B"	\
    --date-font="JetBrains Mono Nerd Font"	\
    --datesize=50		\
    --datepos="340:1015"	\
    \
    --veriftext=""		\
    --wrongtext=""		\
    \
    --indicator			\
    \
    --image=/home/loki/pictures/wallpapers/lock.png

