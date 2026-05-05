#!/bin/sh

if netbird status | rg -q Disconnected; then
  echo ""
else
  echo ""
fi
