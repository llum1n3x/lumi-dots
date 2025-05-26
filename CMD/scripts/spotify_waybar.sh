#!/bin/zsh
while true; do
  title=$(playerctl -p spotify_player metadata title | sed 's/&/&amp;/g')
  artist=$(playerctl -p spotify_player metadata artist | sed 's/&/&amp;/g')
  titleLen=${#title}
  artistLen=${#artist}
  limit=10
  player_status=$(playerctl -p spotify_player -p spotify_player status)

  if [ "$player_status" = "Playing" ] && [ "$titleLen" -gt "$limit" ]; then
    echo "▶ $(echo $title | cut -c 1-9)… - $artist"
  elif [ "$player_status" = "Playing" ]; then
    echo "▶ $title - $artist"
  elif [ "$player_status" = "Paused" ]; then
    echo "Ⅱ $title - $artist"
  else
    echo "No player >:3"
  fi

  sleep 3
done
