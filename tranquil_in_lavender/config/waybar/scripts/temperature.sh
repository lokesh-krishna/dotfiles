#!/usr/bin/env bash

temp=$(curl -s \
  'https://api.open-meteo.com/v1/forecast?latitude=19.00&longitude=72.83&current=temperature_2m' |
  awk -F',' '{print $13}' |
  sed 's/^.*://' |
  sed 's/}}//')

echo "$temp°C"
