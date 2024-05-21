#!/bin/bash

### App not open -> Open and Focus App
### App open but not focused -> Focus App
### App open and focused -> Cycle to next window of the App


# Ensure that both the application command and class are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <app_command> <app_class>. Find out app_class with: xprop | grep -i class"
    exit 1
fi

# Check if wmctrl is installed
if ! command -v wmctrl &> /dev/null; then
    echo "wmctrl is not installed. Please install it and try again."
    notify-send "Error" "wmctrl is not installed. Please install it and try again."
    exit 1
fi

# Check if xdotool is installed
if ! command -v xdotool &> /dev/null; then
    echo "xdotool is not installed. Please install it and try again."
    notify-send "Error" "xdotool is not installed. Please install it and try again."
    exit 1
fi

APP_COMMAND=$1 # for example: intellij
APP_CLASS=$2 # find out with: `xprop | grep -i class` and click on the window (e.g. IntelliJ)


# Get the current window id
current_win_id=$(xdotool getactivewindow)

# Get the current window class (application name)
current_win_class=$(xprop -id $current_win_id WM_CLASS | awk -F '"' '{print $4}')

# List all windows of the current application
windows=($(wmctrl -lx | grep $APP_CLASS | awk '{print $1}'))

# Number of windows of the current application
num_windows=${#windows[@]}

# If there are no windows of the current application, start the application
if [ $num_windows -eq 0 ]; then
    $APP_COMMAND &
    exit 0
fi

# Find the current window index in the list
for i in "${!windows[@]}"; do
    if [ "${windows[$i]}" == "$(printf '0x%08x' $current_win_id)" ]; then
        current_win_index=$i
        break
    fi
done

if [ -z "$current_win_index" ]; then
    # If the current window is not in the list, focus the last window
    wmctrl -ia ${windows[-1]}
else
    # Otherwise, switch to the next window
    next_win_index=$(( (current_win_index + 1) % num_windows ))
    wmctrl -ia ${windows[$next_win_index]}
fi
