#!/usr/bin/env bash

# Unload all wallpapers from memory
hyprctl hyprpaper unload all

# preload wallpaper
hyprctl hyprpaper preload $1

# set wallpaper
hyprctl hyprpaper wallpaper "DP-3,$1"
