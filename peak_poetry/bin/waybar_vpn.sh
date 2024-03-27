#!/bin/sh

if ip link | rg -q wg0; then
    echo ""
else
    echo ""
fi
