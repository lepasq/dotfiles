#!/bin/sh

# Kill running polybar
killall -q polybar

# Wait until killing is finished
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main


# Launch on multiple monitors

#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload main &
#  done
#else
#  polybar --reload main &
#fi
