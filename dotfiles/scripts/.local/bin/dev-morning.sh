#!/bin/bash
xdg-open "https://www.keybr.com/"
local keybr_seconds=5 * 60
sleep $keybr_seconds

xdg-open "https://www.instapaper.com/"
local keybr_seconds=10 * 60
sleep $keybr_seconds

local leetcode_seconds=30 * 60
xdg-open "https://www.techinterviewhandbook.org/grind75/"
sleep $leetcode_seconds

local mock_interview_seconds=15 * 60
xdg-open "https://t3.chat/"
sleep $mock_interview_seconds

"I am a Java Spring Boot Backend Engineer and I want you to give me a Mock Interview. You are the interviewer. It should take arpung 15 min."

# Call next link from link collection list (so read one article per day) use instapaper