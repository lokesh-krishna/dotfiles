#!/bin/sh

text="text"
alt="alt"
tooltip="$(playerctl -p Feishin metadata title) - $(playerctl -p Feishin metadata artist)"
class="class"
percentage="100"

echo "{\"text\": \"$text\", \"alt\": \"$alt\", \"tooltip\": \"$tooltip\", \"class\": \"$class\", \"percentage\": $percentage }"

