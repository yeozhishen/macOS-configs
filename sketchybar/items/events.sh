#!/usr/bin/env bash

COLOR="$YELLOW"
 sketchybar --add item events.earliest left \
            --set events.earliest icon=󰨱 \
            icon.color="$COLOR" \
            icon.padding_left=10 \
            label.color="$COLOR" \
            label.padding_right=20 \
            background.height=26 \
            background.corner_radius="$CORNER_RADIUS" \
            background.corner_radius="$CORNER_RADIUS" \
            background.padding_right=5 \
            background.border_width="$BORDER_WIDTH" \
            background.border_color="$COLOR" \
            background.color="$BAR_COLOR" \
            background.drawing=on \
            popup.background.border_width=2\
            popup.background.corner_radius=6\
            popup.background.border_color=$COLOR\
            label="Loading..." \
            update_freq=15 \
            script="$PLUGIN_DIR/next_event.sh"\
            click_script="$PLUGIN_DIR/show_all_events.sh"
            #click_script="sketchybar -m --set \$NAME popup.drawing=toggle"\
            #--add item events.test popup.events.earliest\
            #--set events.test icon="bleh"\
            #label="bleh"\

