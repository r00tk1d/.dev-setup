#!/bin/bash

# Timer script that counts down from a specified number of minutes
# and sends a notification when the time is up.
# Usage: ./timer.sh <minutes>

set -euo pipefail

# Detect platform
OS="$(uname)"

# Notification function
notify() {
    local title="$1"
    local message="$2"

    if [[ "$OS" == "Darwin" ]]; then
        # macOS notification
        osascript -e "display notification \"$message\" with title \"$title\""
    else
        # Linux notification
        if command -v notify-send &> /dev/null; then
            notify-send "$title" "$message" --urgency=critical
        else
            echo "notify-send not found; cannot send desktop notification."
        fi
    fi
}

# Check argument count
if [ $# -ne 1 ]; then
    echo "Usage: $0 <minutes>"
    exit 1
fi

# Ensure numeric argument
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <minutes> (must be a positive integer)"
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
notify "$title" "$message"
echo "$message"