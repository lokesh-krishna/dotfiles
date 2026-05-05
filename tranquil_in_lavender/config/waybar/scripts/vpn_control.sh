#!/bin/sh

if netbird status | rg -q Disconnected; then
  netbird up
else
  netbird down
fi
