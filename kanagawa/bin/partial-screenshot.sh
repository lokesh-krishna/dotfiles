#!/bin/sh

filename="grim-$(date '+%Y-%m-%d-%H-%M-%S')"
grim -g "$(slurp -d -b "#00000000" -c "#7e9cd8" -s "#00000000" -w 2 -F monospace)" - | tee /home/loki/pictures/screenshots/$(echo $filename).png | wl-copy
magick convert /home/loki/pictures/screenshots/$(echo $filename).png -bordercolor '#7e9cd8' -border 15 /tmp/notification-screenshot.png
notify-send -i /tmp/notification-screenshot.png "  grim" "screenshot of selected area saved"
rm -f /tmp/notification-screenshot.png
