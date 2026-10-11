#!/bin/bash

set -euo pipefail

omarchy webapp install "WhatsApp" "https://web.whatsapp.com/" "whatsapp"
omarchy webapp install "Gmail" "https://mail.google.com/" "https://www.gstatic.com/images/branding/product/2x/gmail_512dp.png"
omarchy webapp install "Google Calendar" "https://calendar.google.com/" "https://www.gstatic.com/images/branding/product/2x/calendar_512dp.png"
omarchy webapp install "YouTube" "https://youtube.com/" "youtube"
omarchy webapp install "Today" "https://today.michael-hirsch.dev/" "today"
omarchy webapp install "Abuy" "https://abuy-michael-hirsch.dev/" "abuy"