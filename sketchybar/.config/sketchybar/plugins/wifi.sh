#!/bin/sh


source "$CONFIG_DIR/colors.sh"

UPDOWN=$(ifstat -i "en0" -b 1 1 | tail -n1)
DOWN=$(echo $UPDOWN | awk "{ print \$1 }" | cut -f1 -d ".")
UP=$(echo $UPDOWN | awk "{ print \$2 }" | cut -f1 -d ".")

DOWN_FORMAT=""
if [ "$DOWN" -gt "999" ]; then
  DOWN_FORMAT=$(echo $DOWN | awk '{ printf "%03.0f Mbps", $1 / 1000}')
else
  DOWN_FORMAT=$(echo $DOWN | awk '{ printf "%03.0f kbps", $1}')
fi

UP_FORMAT=""
if [ "$UP" -gt "999" ]; then
  UP_FORMAT=$(echo $UP | awk '{ printf "%03.0f Mbps", $1 / 1000}')
else
  UP_FORMAT=$(echo $UP | awk '{ printf "%03.0f kbps", $1}')
fi

WIFI_DISCONNECTED="You are not associated with an AirPort network."
WIFI_OFF="You are not associated with an AirPort network.
Wi-Fi power is currently off."

WI_FI_INFO=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')
CURRENT_NETWORK=$(echo "$WI_FI_INFO" | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")

COLOR=$BAR_COLOR
if [[ $CURRENT_NETWORK = $WIFI_OFF ]] || [[ $CURRENT_NETWORK = $WIFI_DISCONNECTED ]]; then
	ICON="􀙈"
	LABEL="Not Connected"
  sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
else
	ICON="􀙇"
	LABEL=$CURRENT_NETWORK
  sketchybar --set "$NAME" icon="$ICON" label=" $DOWN_FORMAT"
  # sketchybar --set "$NAME" icon="$ICON" label="$LABEL $DOWN_FORMAT"
fi
