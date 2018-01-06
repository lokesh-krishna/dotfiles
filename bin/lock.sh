#!/bin/sh

i3lock -n -e                    \
    --textcolor=00000000        \
    --linecolor=00000000        \
    --keyhlcolor=88c0d0ff       \
    --bshlcolor=d8dee9ff	\
    --separatorcolor=00000000   \
    --radius=300		\
    \
    --insidecolor=2e344080      \
    --insidevercolor=2e344080   \
    --insidewrongcolor=2e344080 \
    \
    --ringcolor=5e81acff        \
    --ringvercolor=a3be8cff     \
    --ringwrongcolor=bf616aff   \
    \
    --clock			\
    --timecolor=eceff4ff	\
    --timestr="%H:%M"		\
    --timefont=Hack		\
    --timesize=134		\
    \
    --datecolor=d8dee9ff	\
    --datestr="%A, %e %B"	\
    --datefont=Hack		\
    --datesize=32		\
    --datepos="tx:425"		\
    \
    --textcolor=d8dee9ff	\
    --textsize=64		\
    --veriftext="Verifying..."	\
    --wrongtext="Incorrect"	\
    --indicator			\
    --blur=20
