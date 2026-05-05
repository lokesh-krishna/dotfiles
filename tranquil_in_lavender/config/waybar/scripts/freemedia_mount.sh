#!/bin/sh

if df | rg -q freemedia; then
    fusermount -u /home/loki/videos/freemedia
else
    sshfs freemedia:/root/media /home/loki/videos/freemedia
fi
