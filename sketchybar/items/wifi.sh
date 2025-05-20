#!/usr/bin/env bash

COLOR="$PINK"

sketchybar --add item wifi right \
    --subscribe wifi wifi_change mouse.clicked \
    --set wifi \
    update_freq=3 \
    icon="󰖪 "\
    icon.color="$COLOR" \
    icon.padding_left=10 \
    label.color="$COLOR" \
    label.padding_right=20 \
    background.height=26 \
    background.corner_radius="$CORNER_RADIUS" \
    background.padding_right=5 \
    background.border_width="$BORDER_WIDTH" \
    background.border_color="$COLOR" \
    background.color="$BAR_COLOR" \
    background.drawing=on \
    script="$PLUGIN_DIR/wifi.sh"
