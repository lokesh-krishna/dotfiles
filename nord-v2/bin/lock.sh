#!/bin/sh
i3lock --nofork                 	\
    --ignore-empty-password		\
    \
    --indicator				\
    --bar-indicator			\
    --bar-position="1910"		\
    --bar-base-width="10"		\
    --bar-orientation=vertical		\
    --bar-color=2e3440			\
    --ringvercolor=88c0d0		\
    --ringwrongcolor=bf616a		\
    --bshlcolor=5e81ac			\
    --keyhlcolor=a3be8c			\
    \
    --clock				\
    --timecolor=eceff4ff		\
    --timestr="It's %I:%M %p"		\
    --time-font="Calvin and Hobbes"	\
    --timesize=125			\
    --timepos="1415:900"		\
    --timecolor=2e3440ff		\
    \
    --datecolor=d8dee9ff		\
    --datestr="%A, %d %B"		\
    --datecolor=2e3440ff		\
    --date-font="Calvin and Hobbes"	\
    --datesize=95			\
    --datepos="tx:1025"	\
    \
    --verif-font="Calvin and Hobbes"	\
    --verifsize=150			\
    --veriftext="Welcome home!"		\
    --wrong-font="Calvin and Hobbes"	\
    --wrongsize=150			\
    --wrongtext="No Entry!"		\
    \
    --image=/home/loki/pictures/wallpapers/nord_calvin-and-hobbes.png

