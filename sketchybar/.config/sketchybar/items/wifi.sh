#!/bin/bash

sketchybar --add item wifi right \
           --set wifi update_freq=1 \
                      script="$PLUGIN_DIR/wifi.sh" \
           --subscribe wifi wifi_change

