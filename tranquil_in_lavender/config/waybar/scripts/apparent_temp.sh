#!/usr/bin/env bash

apparent_temp=$(curl -s \
  'https://api.open-meteo.com/v1/forecast?latitude=19.00&longitude=72.83&current=apparent_temperature' |
  awk -F',' '{print $13}' |
  sed 's/^.*://' |
  sed 's/}}//')

echo "($apparent_temp°C)"
