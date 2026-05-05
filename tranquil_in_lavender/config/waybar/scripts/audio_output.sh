#!/bin/sh

sink=$(pactl get-default-sink)

if [[ $sink == *"usb"* ]]; then
  echo ""
elif [[ $sink == *"pci"* ]]; then
  echo ""
fi
