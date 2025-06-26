#!/usr/bin/env bash

sudo pacman -Sy i3 flameshot nitrogen libnotify ttf-martian-mono-nerd

mkdir -p ~/Pictures/screenshots

fc-cache -fv

rm -rf ~/.config/i3
ln -s $(pwd) ~/.config/i3
ln -sf $(pwd)/polybar/config.ini /etc/polybar/config.ini
