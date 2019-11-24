#!/bin/sh

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer normal 120 \
    'notify-send "Inactivity detected. Locking in 10"' \
    '' \
  `# Undim & lock after 10 more seconds` \
  --timer normal 10 \
    '/home/adamt/.config/i3/i3lock.sh' \
    ''
