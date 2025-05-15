#!/bin/bash

# Timer script that counts down from a specified number of minutes
# and sends a notification when the time is up.
# Usage: ./timer.sh <minutes>

# Check if notify-send is available
if ! command -v notify-send &> /dev/null; then
    echo "notify-send could not be found. Please install libnotify-bin."
    exit 1
fi
# Check if the user provided an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <minutes>"
    exit 1
fi

# Ensure a valid numeric argument is provided
if [[ -z "$1" || ! "$1" =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <minutes>"
    exit 1
fi

minutes=$1
seconds=$((minutes * 60))
title="Timer Finished"
message="Your $minutes-minute timer is up!"

echo "Timer set for $minutes minutes..."

# Countdown loop
while ((seconds > 0)); do
    mins_left=$((seconds / 60))
    secs_left=$((seconds % 60))
    printf "\rTime left: %02d:%02d " "$mins_left" "$secs_left"
    sleep 1
    ((seconds--))
done

# Clear timer output
printf "\r\033[K"

# Send notification and print message
notify-send "$title" "$message" --urgency=critical 2>/dev/null
echo "$message"
