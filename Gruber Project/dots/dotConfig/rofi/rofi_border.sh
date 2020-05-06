#!/bin/bash

# options to be displayed
option0="Split Horizontal"
option1="Split Vertical"
option2="Stacked"
option3="Tabbed"

# options passed to variable
options="$option0\n$option1\n$option2\n$option3"

selected="$(echo -e "$options" | rofi -lines 4 -dmenu -p "i3layout")"
case $selected in
    $option0)
        i3-msg layout toggle split horizontal;;
    $option1)
        i3-msg layout toggle split vertical;;
    $option2)
        i3-msg layout stacked;;
    $option3)
        i3-msg layout tabbed;;
esac
