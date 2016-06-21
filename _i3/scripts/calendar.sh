#!/bin/bash

if [[ -z $BLOCK_BUTTON ]]; then
	# First part of if is what we cant to be displayed in the block
	date '+   %d/%m/%Y   %H:%M'
else
	# The else part is what we want to do when the block is clicked
	cal | rofi -dmenu -no-fullscreen -hide-scrollbar -font "DejaVu Sans Mono 10" -p "$(date +"%A")" -padding 2 -width 11 -location 3 -yoffset 24 -lines 7
fi
