#!/bin/bash

# Linux only

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