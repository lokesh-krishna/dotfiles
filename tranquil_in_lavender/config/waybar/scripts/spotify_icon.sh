#!/bin/sh

status=$(playerctl -p spotify status)

if [ "$status" = "Playing" ]; then
  echo ""
elif [ "$status" = "Paused" ]; then
  echo ""
else
  echo ""
fi
