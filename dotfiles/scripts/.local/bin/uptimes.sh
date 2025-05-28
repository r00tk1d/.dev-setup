#!/bin/bash

### Current Uptime ###
today_start_time=$(last | grep -m1 reboot | awk '{print $8}')
today_start_seconds=$(date -d "$today_start_time" +%s)
current_seconds=$(date +%s)

today_till_now_seconds=$((current_seconds - today_start_seconds))
hours=$((today_till_now_seconds / 3600))
minutes=$(( (today_till_now_seconds % 3600) / 60 ))

echo "Current Uptime: ${hours}h ${minutes}m"
echo ""

### Last 15 Uptimes ###
uptime=$(last | grep -m15 reboot | awk '{print $5, $6, $7, $8, $9, $10, $11}')

# print pretty
echo "$uptime" | while read -r line; do
  echo "$line"
done



# | sed "s/still running/$(date +'%H:%M')../"


# # uptime
# last | grep -m10 reboot

# # for getting Locking events
# gdbus monitor -y -d org.freedesktop.login1 | grep LockedHint


# idea: uptime - screenLocked = worktime
# in file saven? immer 10 oder so speichern


# Write timestamps of locking and unlocking in a logfile. This should be in a separate .sh file which is executed on startup
# gdbus monitor -y -d org.freedesktop.login1 | grep LockedHint > logfile.txt
# gdbus monitor -y -d org.freedesktop.login1 | grep "'LockedHint': <false>"
