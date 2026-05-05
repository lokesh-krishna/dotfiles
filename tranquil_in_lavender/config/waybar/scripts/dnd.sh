#!/bin/sh

status=$(dunstctl get-pause-level)

if [ $status == 0 ]; then
  echo ""
else
  echo ""
fi
