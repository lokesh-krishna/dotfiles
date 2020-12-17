#!/bin/sh

# usage: import-gsettings <gsettings key>:<settings.ini key> <gsettings key>:<settings.ini key> ...

expression=""
for pair in "$@"; do
    IFS=:; set -- $pair
    expressions="$expressions -e 's:^$2=(.*)$:gsettings set org.gnome.desktop.interface $1 \1:e'"
done
IFS=
eval exec sed -E $expressions "${XDG_CONFIG_HOME:-$HOME/.config}"/gtk-3.0/settings.ini >/dev/null
