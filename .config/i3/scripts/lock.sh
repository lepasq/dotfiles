#!/bin/sh

# Mute audio & microphone
/usr/bin/pactl set-sink-mute 0 1
/usr/bin/pactl set-source-mute @DEFAULT_SOURCE@ 1


# Pause spotify
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify     /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause


# Lock the screen
i3lock -d -i $HOME/.cache/wall.png
