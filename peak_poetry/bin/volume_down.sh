#!/bin/sh

# unmute & decrease
pactl set-sink-mute @DEFAULT_SINK@ false
pactl set-sink-volume @DEFAULT_SINK@ -5%
