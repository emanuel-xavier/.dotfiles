#!/usr/bin/env bash

sudo pacman -Sy kitty ttf-martian-mono-nerd

fc-cache -fv

rm -rf ~/.config/kitty
ln -s $(pwd) ~/.config/kitty
