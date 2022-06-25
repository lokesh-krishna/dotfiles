#!/bin/sh
bemenu --prompt 'enter expression' < /dev/null > /tmp/question 2> /dev/null
sed -i 's/^/print(/' /tmp/question && sed -i 's/$/)/' /tmp/question
cat /tmp/question | lua /tmp/question > /tmp/answer
sed -i 's/^/‎/' /tmp/answer 
cat /tmp/answer | xargs -n 1 notify-send -i /home/loki/pictures/icons/catpulator.png 'And the answer is...'
cat /tmp/answer | wl-copy -n
rm -f /tmp/question /tmp/answer

