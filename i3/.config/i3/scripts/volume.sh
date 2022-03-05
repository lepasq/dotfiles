#!/bin/bash

pactl upload-sample /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga

if [[ "$1" == "mute" ]]; then
  for sink in $(pactl list sinks short | cut -f 1); do
    pactl set-sink-mute "$sink" 1
  done
  exit 0
else
  pactl set-sink-mute @DEFAULT_SINK@ 0
fi

pactl set-sink-volume @DEFAULT_SINK@ "$1"

if [[ "$2" != "nosound" ]]; then
  pactl play-sample audio-volume-change @DEFAULT_SINK@
fi
