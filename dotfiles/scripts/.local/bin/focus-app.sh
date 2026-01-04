#!/bin/bash

APP_NAME=$1

# Check if the app is running
if ! pgrep -x "$APP_NAME" > /dev/null; then
    # App is not open: Open and Focus
    open -a "$APP_NAME"
else
    # App is open: Use AppleScript to Focus or Cycle windows
    osascript -e "
        tell application \"System Events\"
            tell process \"$APP_NAME\"
                set allWindows to every window
                if (count of allWindows) is 0 then
                    # No windows open, just launch/focus
                    do shell script \"open -a '$APP_NAME'\"
                else
                    # Cycle to the next window
                    keystroke \"\`\" using command down
                    # Bring the app to the front
                    set frontmost to true
                end if
            end tell
        end tell"
fi