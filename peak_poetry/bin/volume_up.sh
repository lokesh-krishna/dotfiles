#!/bin/sh

# unmute & increase
pactl set-sink-mute @DEFAULT_SINK@ false
pactl set-sink-volume @DEFAULT_SINK@ +5%
