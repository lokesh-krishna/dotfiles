#!/bin/bash

sink=$(pactl get-default-sink)

if [[ $sink == *"usb"* ]]; then
  pactl set-default-sink alsa_output.pci-0000_13_00.6.analog-stereo
elif [[ $sink == *"pci"* ]]; then
  pactl set-default-sink alsa_output.usb-TTGK_Technology_Co._Ltd_Audiocular_D07-00.analog-stereo
fi
