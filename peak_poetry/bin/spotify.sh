#!/bin/sh

text="text"
alt="alt"
tooltip="$(playerctl -p spotify metadata title) - $(playerctl -p spotify metadata artist)"
class="class"
percentage="100"

echo "{\"text\": \"$text\", \"alt\": \"$alt\", \"tooltip\": \"$tooltip\", \"class\": \"$class\", \"percentage\": $percentage }"

