#!/bin/bash

#set -x

MOUSE="mouse"
#MOUSE="touch"
BUTTON=2

DELAY=$1

CANT=$2

MOUSE_ID=$(xinput --list | grep -i -m 1 $MOUSE | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')

STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
while true; do
    sleep 0.1
    if xinput --query-state $MOUSE_ID | grep -q "button\[$BUTTON\]=down";
    then
        set -x
        xdotool click --delay $DELAY --repeat $CANT 3
        set +x
    fi
done
