#!/bin/bash

PICTURE="${HOME}/Pictures/screenshots/Screenshot-$(date +%F_%T).png"

grim -g "$(slurp -w 0)" - | wl-copy && wl-paste >"${PICTURE}"

if [[ -s "${PICTURE}" ]]; then
  dunstify "Screenshot of the region taken" -t 1500 # screenshot of a region
else
  dunstify "Region not found; Screenshot has not taken" -t 1500 # region not found
  rm -f "${PICTURE}"
fi
