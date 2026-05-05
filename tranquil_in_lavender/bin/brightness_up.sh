#!/bin/sh

ddcutil --bus 8 setvcp 10 + 5
current_brightness=$(ddcutil --bus 8 getvcp 10 | awk '{print $9}' | sed 's/,//' | sed 's/unavailable//')
notify-send -i ~/pictures/icons/brightness.png 'Brightness' "Current brightness: $current_brightness%" -h int:value:$current_brightness
