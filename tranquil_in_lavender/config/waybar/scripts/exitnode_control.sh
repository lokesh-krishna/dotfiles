#!/bin/sh

netbird networks list | awk 'FNR == 5' | rg -q 'Not Selected'

if [ $? -eq 0 ]; then
  netbird networks select exit_node
else
  netbird networks deselect exit_node
fi
