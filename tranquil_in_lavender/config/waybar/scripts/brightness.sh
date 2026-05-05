#!/usr/bin/env bash

brightness=$(ddcutil --bus 8 getvcp 10 \
    | awk '{print $9}' \
    | sed 's/,//'
)

echo $brightness
