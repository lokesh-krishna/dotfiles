#!/bin/sh

filename="grim-$(date '+%d-%m-%Y-%H-%M-%S')"
grim - | tee /home/loki/pictures/screenshots/$(echo $filename).png | wl-copy
notify-send -i /home/loki/pictures/icons/screenshot.png "grim" "desktop screenshot saved"
