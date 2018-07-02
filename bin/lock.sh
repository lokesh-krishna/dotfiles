#!/bin/sh

i3lock -n -e                    \
    --linecolor=00000000        \
    --keyhlcolor=88c0d0ff       \
    --bshlcolor=d8dee9ff	\
    --separatorcolor=00000000   \
    --radius=300		\
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
    --time-font=Hack		\
    --timesize=134		\
    \
    --datecolor=d8dee9ff	\
    --datestr="%A, %d %B"	\
    --date-font=Hack		\
    --datesize=30		\
    --datepos="tx:525"		\
    \
    --veriftext="Verifying..."	\
    --verif-font=Hack		\
    --verifcolor=d8dee9ff	\
    --verifsize=45		\
    \
    --wrongtext="Incorrect"	\
    --wrong-font=Hack		\
    --wrongcolor=d8dee9ff	\
    --wrongsize=45		\
    \
    --indicator			\
    --color=2e3440
