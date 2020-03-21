#!/bin/sh

filename=$(date '+%Y-%m-%d-%H-%M-%S')
pkill unclutter
import /tmp/$(echo $filename).png
unclutter --ignore-scrolling --fork
convert /tmp/$(echo $filename).png -bordercolor '#88c0d0' -border 15x15 /tmp/notification-screenshot.png
xclip -selection clipboard -t image/png /tmp/$(echo $filename).png
notify-send -i /tmp/notification-screenshot.png "󰹑 ImageMagick" "Screenshot saved to clipboard"
rm -f /tmp/$(echo $filename).png /tmp/notification-screenshot.png
