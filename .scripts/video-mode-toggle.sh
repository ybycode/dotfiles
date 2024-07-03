#!/usr/bin/env bash

INTERNAL="eDP1"

connecteMonitors=$(xrandr | grep -E " connected" | awk '{ print $1 }')
nbConnectedMonitors=$(echo "$connecteMonitors" | wc -l)
# Find the 2 first active monitors:
active2Monitors="$(xrandr --listactivemonitors | tail -n +2 | awk '{ print $NF }' | head -n 2)"
nbActivesMonitors=$(echo "$active2Monitors" | wc -l)
otherMonitor="$(echo "$connecteMonitors" | grep -v "$INTERNAL")"

echo "connecteMonitors:"
echo "$connecteMonitors"
echo
echo "active2Monitors:"
echo "$active2Monitors"
echo
echo "otherMonitor:"
echo "$otherMonitor"
echo


logInfo() {
    >&2 echo "$1"
}

logError() {
    logInfo "ERROR: $1"
}

if [[ $nbConnectedMonitors -eq 0 ]]; then
    logInfo "no monitor, nothing to do"
    exit 0
fi

if [[ $nbConnectedMonitors -eq 1 ]]; then
    logInfo "only one monitor, just make sure it's active"
    other="$(echo "$active2Monitors" | grep -v "$connecteMonitors")"
    args=(--output "$connecteMonitors" --auto)
    if [[ -n "$other" ]]; then
        args+=(--output "$other" --off)
    fi
    xrandr "${args[@]}"
    exit 0
fi

# At this point, if the script is still running, that means there's at least 2 monitors connected (this script only cares for the first 2 anyway).
#
# rotate modes from:
# - only the INTERNAL active,
# - to two monitors made active,
# - to the other (non internal) monitor made active.

if [ "$nbActivesMonitors" -eq 1 ]; then
    if [ "$active2Monitors" == "$INTERNAL" ]; then
        logInfo "activate both monitors, make the internal primary, place the other monitor above the internal"
        xrandr --output "$INTERNAL" --auto --primary --output "$otherMonitor" --auto --above "$INTERNAL"
        exit 0
    elif [ "$active2Monitors" == "$otherMonitor" ]; then
        logInfo "activate the internal monitor"
        xrandr --output "$INTERNAL" --auto --output "$otherMonitor" --off
        exit 0
    else
        logError "Is this case possible?"
        exit 1
    fi
elif [ "$nbActivesMonitors" -eq 2 ]; then
    logInfo  "activate the other monitor"
    xrandr --output "$INTERNAL" --off --output "$otherMonitor" --auto
else
    logError "More than 2 monitors active. The script can't manage, leaving."
    exit 1
fi
