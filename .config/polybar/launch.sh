#!/bin/sh

# Kill running polybar
killall -q polybar

# Wait until killing is finished
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -c $HOME/.config/polybar/config.ini DP-2-1 &
polybar -c $HOME/.config/polybar/config.ini eDP-1 &
