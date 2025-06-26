#!/bin/bash

icon_color=$1
text_color=$2

# https://github.com/emmyvinte/polybar-battery.sh

# Coloque aqui o local que identifica sem seu dispositivo está carregando ou descarregando
# IMPORTANTE ! A saída deve ser em binário, caso contrário resultará em erro!
is_plugged=$(cat /sys/class/power_supply/AC0/online)

# Coloque aqui o local que identifica o número relativo a porcentagem da bateria de seu dispositivo
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

# EXTRA! Altere os ícones para qualquer um de sua preferência, assim como os valores da %
# EXTRA! Customize a cor do ícone começando com %{F#} e fechando com %{F-}
if [ "$is_plugged" -eq 1 ]; then
    icon="%{F$icon_color} %{F-}"
else
    if [ "$battery_level" -le 15 ]; then
        icon="%{F#$icon_color} %{F-}"
        notify-send "batery level: $battery_level" -u critical -i ~/.config/i3/polybar/low-batery.jpg
    elif [ "$battery_level" -le 25 ]; then
        icon="%{F#$icon_color} %{F-}"
        notify-send "batery level: $battery_level" -u low -i ~/.config/i3/polybar/low-batery.jpg
    elif [ "$battery_level" -le 60 ]; then
        icon="%{F#$icon_color} %{F-}"
    elif [ "$battery_level" -le 90 ]; then
        icon="%{F#$icon_color} %{F-}"
    else
        icon="%{F#$icon_color} %{F-}"
    fi
fi

echo "$icon ${F#$text_color}$battery_level%"
