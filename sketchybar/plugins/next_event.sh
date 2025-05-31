#!/bin/bash
# Get upcoming events for today and future
 ICAL_OUTPUT=$( icalBuddy -n -eed -tf "%H:%M" --excludeAllDayEvents --excludeEventProps "location,notes" eventsToday)
#
# # Extract the first event block (title and time)
EVENT_TITLE=$(echo "$ICAL_OUTPUT" | grep '^•' | head -n 1 | sed -E 's/^• *//; s/ *\([^)]*\)//') 
EVENT_TIME=$(echo "$ICAL_OUTPUT" | grep -A1 '^•' | grep -v '^•' | head -n 1 | xargs)
#
# # Combine title and time
 if [[ -n "$EVENT_TITLE" && -n "$EVENT_TIME" ]]; then
   LABEL=" $EVENT_TIME - $EVENT_TITLE"
   else
     LABEL="No upcoming events"
     fi
#
     sketchybar --set $NAME label="$LABEL"
