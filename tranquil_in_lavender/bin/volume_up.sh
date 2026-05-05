#!/bin/sh

# unmute & increase
pactl set-sink-mute @DEFAULT_SINK@ false
pactl set-sink-volume @DEFAULT_SINK@ +5%
current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print $5}' | sed 's/%//')
notify-send -i ~/pictures/icons/volume.png 'Volume' "Current volume: $current_volume%" -h int:value:$current_volume
