#!/usr/bin/env bash

icon_color=$1
text_color=$2

# https://github.com/emmyvinte/polybar-battery.sh

# Coloque aqui o local que identifica sem seu dispositivo está carregando ou descarregando
# IMPORTANTE ! A saída deve ser em binário, caso contrário resultará em erro!
is_plugged=$(cat /sys/class/power_supply/AC0/online)

# Coloque aqui o local que identifica o número relativo a porcentagem da bateria de seu dispositivo
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

# File to store notification state
notification_state_file="/tmp/battery_notification_state"

send_notification() {
    urgency=$1
    current_time=$(date +%s)
    last_notification_time=0
    last_notification_level=0

    if [ -f "$notification_state_file" ]; then
        last_notification_time=$(cat "$notification_state_file" | cut -d' ' -f1)
        last_notification_level=$(cat "$notification_state_file" | cut -d' ' -f2)
    fi

    time_diff=$((current_time - last_notification_time))
    level_diff=$((last_notification_level - battery_level))

    if [ "$time_diff" -gt 120 ] || [ "$level_diff" -ge 5 ]; then
        notify-send "batery level: $battery_level" -u "$urgency" -i ~/.config/i3/polybar/low-batery.jpg
        echo "$current_time $battery_level" > "$notification_state_file"
    fi
}


# EXTRA! Altere os ícones para qualquer um de sua preferência, assim como os valores da %
# EXTRA! Customize a cor do ícone começando com %{F#} e fechando com %{F-}
if [ "$is_plugged" -eq 1 ]; then
    icon="%{F$icon_color} %{F-}"
else
    if [ "$battery_level" -le 15 ]; then
        icon="%{F#$icon_color} %{F-}"
        send_notification "critical"
    elif [ "$battery_level" -le 25 ]; then
        icon="%{F#$icon_color} %{F-}"
        send_notification "low"
    elif [ "$battery_level" -le 60 ]; then
        icon="%{F#$icon_color} %{F-}"
    elif [ "$battery_level" -le 90 ]; then
        icon="%{F#$icon_color} %{F-}"
    else
        icon="%{F#$icon_color} %{F-}"
    fi
fi

echo "$icon ${F#$text_color}$battery_level%"
