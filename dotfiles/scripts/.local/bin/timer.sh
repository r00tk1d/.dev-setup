#!/bin/bash
if [[ -z $1 || ! $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: timer <minutes>"
    return 1
fi

local minutes=$1
local seconds=$((minutes * 60))
local title="Timer Finished"
local message="Your $minutes-minute timer is up!"

echo "Timer set for $minutes minutes..."
while [ $seconds -gt 0 ]; do
    local mins_left=$((seconds / 60))
    local secs_left=$((seconds % 60))
    printf "\rTime left: %02d:%02d " $mins_left $secs_left
    sleep 1
    ((seconds--))
done
printf "\r\033[K"

notify-send $title $message --urgency=high
echo $message