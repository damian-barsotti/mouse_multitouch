#!/bin/bash

#set -x

echoerr() { echo "$@" 1>&2; }

prog_exists() {
    if ! command -v $1 &> /dev/null
    then
        echoerr $1 cannot be found
        exit 1
    fi
}

for prg in xinput xdotool
do
    prog_exists $prg
done

MOUSE="mouse"
#MOUSE="touch"
BUTTON=${3:-1}
ACT_BUTTON=${4:-2}

DELAY=$1

CANT=$2

MOUSE_LINE=$(xinput --list | grep -i -m 1 $MOUSE)
MOUSE_ID=$(echo "$MOUSE_LINE" | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')

echo Mouse: $MOUSE_LINE

STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
while true; do
    sleep 0.1
    if xinput --query-state $MOUSE_ID | grep -q "button\[$ACT_BUTTON\]=down";
    then
        set -x
        xdotool click --delay $DELAY --repeat $CANT $BUTTON
        set +x
    fi
done
