#!/bin/sh

# get current volume in percent
function volume_percent {
    pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1 {print $5}'
}

# get current volume as integer
function volume_integer {
    volume_percent | sed s/%//
}

# unmute, increase and notify
pactl set-sink-mute @DEFAULT_SINK@ false
pactl set-sink-volume @DEFAULT_SINK@ +5%
#notify-send "pactl" "Volume: $(volume_percent)" --hint="int:value:$(volume_integer)"
