#!/bin/sh

filename="grim-$(date '+%d-%m-%Y-%H-%M-%S')"
grim - | tee /home/loki/pictures/screenshots/$(echo $filename).png | wl-copy
magick convert /home/loki/pictures/screenshots/$(echo $filename).png -bordercolor '#96cdfb' -border 30 /tmp/screenshot-notification.png
notify-send -i /tmp/screenshot-notification.png "  grim" "desktop screenshot saved"
rm -f /tmp/screenshot-notification.png
