#!/bin/sh

filename="grim-$(date '+%Y-%m-%d-%H-%M-%S')"
grim -g "$(slurp -d -b "#302d4180" -c "#96cdfb" -s "#57526840" -w 2)" - | tee /home/loki/pictures/screenshots/$(echo $filename).png | wl-copy
magick convert /home/loki/pictures/screenshots/$(echo $filename).png -bordercolor '#96cdfb' -border 15 /tmp/notification-screenshot.png
notify-send -i /tmp/notification-screenshot.png "  grim" "screenshot of selected area saved"
rm -f /tmp/notification-screenshot.png
