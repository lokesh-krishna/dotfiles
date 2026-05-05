#!/usr/bin/env bash

netbird networks list | awk 'FNR == 5' | rg -q 'Not Selected'

if [ $? -eq 0 ]; then
  echo ""
else
  echo ""
fi
