
current_brightness=$(xrandr --verbose --current | grep eDP-1 -A5 | grep Brightness | awk '{print $2}')

# Check if an argument was provided (increase or decrease)
if [ -z "$1" ]; then
  echo "Usage: $0 [i|d|increase|decrease]"
  exit 1
fi

# Check the argument and calculate the new brightness level accordingly
if [ "$1" = "increase" -o "$1" = "i" ]; then
  new_brightness=$(echo "$current_brightness + 0.05" | bc)
elif [ "$1" = "decrease" -o "$1" = "d" ]; then
  new_brightness=$(echo "$current_brightness - 0.05" | bc)
fi

xrandr --output eDP-1 --brightness $new_brightness
echo "$current_brightness -> $new_brightness"
