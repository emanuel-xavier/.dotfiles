#!/usr/bin/env bash

sudo pacman -Sy kitty

rm -rf ~/.config/kitty
ln -s $(pwd) ~/.config/kitty
