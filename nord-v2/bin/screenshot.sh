#!/bin/sh

maim --delay=1 --quiet ~/pictures/screenshots/$(date +%s).png
notify-send "  Maim" "Screenshot saved"
