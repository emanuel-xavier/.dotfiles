#!/usr/bin/env bash

sudo apt install i3 i3blocks flameshot nitrogen -y

mkdir -p ~/Pictures/screenshots

rm -rf ~/.config/i3
ln -s $(pwd) ~/.config/i3
ln -s $(pwd)/i3blocks.conf ~/.i3blocks.conf
