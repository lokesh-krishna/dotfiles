#!/bin/sh

filename="grim-$(date '+%Y-%m-%d-%H-%M-%S')"
grim -g "$(slurp -d -b "#00000000" -c "#89b4fa" -s "#00000000" -w 2 -F "Asap")" - | tee /home/loki/pictures/screenshots/$(echo $filename).png | wl-copy
notify-send -i /home/loki/pictures/icons/screenshot.png "grim" "screenshot of selected area saved"
rm -f /tmp/notification-screenshot.png
