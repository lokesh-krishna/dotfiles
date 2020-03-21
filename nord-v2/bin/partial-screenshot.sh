#!/bin/sh

filename=$(date '+%Y-%m-%d-%H-%M-%S')
pkill unclutter
import /home/loki/pictures/screenshots/$(echo $filename).png
unclutter --ignore-scrolling --fork
convert /home/loki/pictures/screenshots/$(echo $filename).png -bordercolor '#88c0d0' -border 15x15 /tmp/notification-screenshot.png
notify-send -i /tmp/notification-screenshot.png "󰹑 ImageMagick" "Screenshot of selected area saved"
rm -f /tmp/notification-screenshot.png
