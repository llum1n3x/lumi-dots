#!/bin/zsh

CUR_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full" | sed 's/^ *//' | sed 's/^state:*//' | sed 's/^ *//' | tr -d \\n | cut -c 1-3 | tr -d \\n)
# CUR_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full" | sed 's/^ *//' | sed 's/^state:*//' | sed 's/^ *//' | cut -c 1-3 | tr -d \\n)

while true; do
  STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full" | sed 's/^ *//' | sed 's/^state:*//' | sed 's/^ *//' | tr -d \\n | cut -c 1-3 | tr -d \\n)
  # STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full" | sed 's/^ *//' | sed 's/^state:*//' | sed 's/^ *//' | cut -c 1-3 | tr -d \\n)

  if [[ "$STATE" != "$CUR_STATE" ]]; then
    if [[ "$STATE" == "dis" ]]; then
      dunstify -t 2500 "Battery: Discharging"
    elif [[ "$STATE" == "cha" ]]; then
      dunstify -t 2500 "Battery: Charging"
    elif [[ "$STATE" == "ful" ]]; then
      dunstify -t 2500 "Battery: Fully-charged"
    elif [[ "$STATE" == "pen" ]]; then
      dunstify -t 2500 "Battery: Pending-charge"
    else
      dunstify -t 2500 "Battery: Unknown"
    fi

    CUR_STATE=$STATE
  fi

  sleep 5
done
