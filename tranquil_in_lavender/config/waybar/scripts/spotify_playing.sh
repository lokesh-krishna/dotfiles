#!/usr/bin/env bash

echo "$(playerctl -p spotify metadata title) - $(playerctl -p spotify metadata artist)"
