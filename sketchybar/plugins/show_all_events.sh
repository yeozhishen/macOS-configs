#!/usr/bin/env bash
for id in $(sketchybar --query bar | jq -r '.items[]' | grep '^events' | grep -v '^events\.earliest$'); do
  sketchybar -m --remove "$id"
done
sketchybar -m --set events.earliest popup.drawing=toggle

ICAL_OUTPUT=$(icalBuddy -n -eed -tf "%H:%M" eventsToday)

INDEX=0
echo "$ICAL_OUTPUT" | awk '
{
  if (NR % 2 == 1) {
    title = $0
    gsub(/^• */, "", title)
    gsub(/ *\([^)]*\)/, "", title)
  } else {
    time = $0
    sub(/^[ \t]+/, "", time)
    sub(/[ \t]+$/, "", time)

    if (length(title) && length(time)) {
      printf("󰨱 %s - %s\n", time, title)
    }
  }
}  
'| while read -r EVENT; do
  ITEM_NAME="events.$INDEX"
  sketchybar -m --add item "$ITEM_NAME" popup.events.earliest \
                 --set "$ITEM_NAME" label="$EVENT" \
                 icon.drawing=off \
                 click_script="sketchybar -m --set events.earliest popup.drawing=off"
  INDEX=$((INDEX + 1))
done

EVENT_TITLE=$(echo "$ICAL_OUTPUT" | grep '^•' | head -n 1 | sed -E 's/^• *//; s/ *\([^)]*\)//') 
EVENT_TIME=$(echo "$ICAL_OUTPUT" | grep -A1 '^•' | grep -v '^•' | head -n 1 | xargs)
#
## # Combine title and time
 if [[ -n "$EVENT_TITLE" && -n "$EVENT_TIME" ]]; then
    break   
else
    sketchybar -m --add item events.none popup.events.earliest \
                 --set events.none label="No events today" \
                                   icon.drawing=off
fi
#
#     sketchybar --set $NAME label="$LABEL"
#

