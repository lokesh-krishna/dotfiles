#!/bin/sh
i3lock --nofork                 	\
    --ignore-empty-password		\
    \
    --indicator				\
    --bar-indicator			\
    --bar-position="1070"		\
    --bar-base-width="10"		\
    --bar-orientation=horizontal	\
    --bar-color=2e3440			\
    --ringvercolor=88c0d0		\
    --ringwrongcolor=bf616a		\
    --bshlcolor=5e81ac			\
    --keyhlcolor=a3be8c			\
    \
    --clock				\
    --timecolor=eceff4ff		\
    --timestr="%I:%M %p"		\
    --time-font="Calvin and Hobbes"	\
    --timesize=150			\
    --timepos="1500:875"		\
    --timecolor=2e3440ff		\
    \
    --datecolor=d8dee9ff		\
    --datestr="%A, %d %B"		\
    --datecolor=2e3440ff		\
    --date-font="Calvin and Hobbes"	\
    --datesize=95			\
    --datepos="tx:1020"	\
    \
    --verif-font="Calvin and Hobbes"	\
    --verifsize=150			\
    --veriftext="Welcome home!"		\
    --wrong-font="Calvin and Hobbes"	\
    --wrongsize=150			\
    --wrongtext="No Entry!"		\
    \
    --image=$HOME/pictures/wallpapers/nord_calvin-and-hobbes.png

