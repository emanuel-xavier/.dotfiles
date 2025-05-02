#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Alternatively, use the nuclear option:
# killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "Bars launched..."

# Launch Polybar on each detected monitor
if type "xrandr"; then
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo "---" | tee -a /tmp/polybar-${monitor}.log
    MONITOR=$monitor polybar --reload bar -c ~/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/polybar-${monitor}.log & disown
    # MONITOR=$monitor polybar --reload bar 2>&1 | tee -a /tmp/polybar-${monitor}.log & disown
  done
else
  polybar --reload bar 2>&1 | tee -a /tmp/polybar.log & disown
fi
