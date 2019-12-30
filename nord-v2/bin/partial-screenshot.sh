#!/bin/sh

maim --select --bordersize=2 --color=136,192,208 --quiet ~/pictures/screenshots/partial-$(date +%s).png
notify-send "  Maim" "Screenshot saved"
