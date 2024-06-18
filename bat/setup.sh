#!/bin/bash

sudo pacman -S wget bat
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build

ln -sf "$(pwd)/config" "$(bat --config-dir)/config"
