#!/usr/bin/env bash

sudo pacman -Sy i3 flameshot nitrogen

mkdir -p ~/Pictures/screenshots

rm -rf ~/.config/i3
ln -s $(pwd) ~/.config/i3
ln -sf $(pwd)/polybar/config.ini /etc/polybar/config.ini
