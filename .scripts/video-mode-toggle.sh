#!/usr/bin/env bash

INTERNAL="eDP1"
EXTERNAL="HDMI1"

connecteOutputs=$(xrandr | grep -E " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")

if [ `echo $connecteOutputs | wc -w` -le 1 ]; then
    xrandr --output $INTERNAL --auto --output $EXTERNAL --off
    exit 0
fi

activeOutputs=$(xrandr | grep -E " connected (primary )?[1-9]+" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")

# The external screen is connected:
# rotate modes from internal -> both -> external

nbActives=`echo $activeOutputs | wc -w`

if [ "$nbActives" -eq 1 ]; then
    if [ "$activeOutputs" == "$INTERNAL" ]; then
        # active both, make the internal primary, place the external right of the external
        xrandr --output $INTERNAL --auto --primary --output $EXTERNAL --auto --right-of $INTERNAL
        exit 0
    elif [ "$activeOutputs" == "$EXTERNAL" ]; then
        # active internal
        xrandr --output $INTERNAL --auto --output $EXTERNAL --off
        exit 0
    else
        echo "The active input ($activeOutputs) is neither $INTERNAL or $EXTERNAL. There's a configuration problem. Leaving." >> errr.log
        exit 1
    fi
elif [ "$nbActives" -eq 2 ]; then
    # active the external:
    xrandr --output $INTERNAL --off --output $EXTERNAL --auto
else
    echo "More than 2 monitors active. The script can't manage, leaving." >> errr.log
    exit 1
fi
