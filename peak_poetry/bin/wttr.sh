#!/bin/sh

# save information as variables
condition="$(curl wttr.in/Mumbai?format=%C+%c)"
temp="$(curl wttr.in/Mumbai?format='%t+(%f)')"
sunrise="Sunrise: $(curl wttr.in/Mumbai?format=%S)"
sunset="Sunset: $(curl wttr.in/Mumbai?format=%s)"
moon="Moon Phase: $(curl wttr.in/Mumbai?format=%m)"

# store output in file
echo -e "$condition\n$temp\n$sunrise\n$sunset\n$moon" > /tmp/weather
sed -i 's/$/\\n/' /tmp/weather
paste -sd '' /tmp/weather > /tmp/weather2
sed -i 's/^/"/' /tmp/weather2 && sed -i 's/$/"/' /tmp/weather2

cat /tmp/weather2 | xargs -n 1 notify-send 'Weather Report' -i '/home/loki/pictures/icons/cloud.png'

rm /tmp/weather /tmp/weather2
