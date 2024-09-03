#!/bin/bash

install_tmux() {
    if [ -f /etc/arch-release ]; then
        sudo pacman -S tmux
    elif [ -f /etc/os-release ] && grep -qi ubuntu /etc/os-release; then
        sudo apt install tmux -y
    else
        echo "Unsupported distribution. Please install tmux manually."
        exit 1
    fi
}

install_tmux

mkdir -p ~/.config/tmux 
rm -rf ~/.config/tmux/*
ln -s "$(pwd)/tmux.conf" ~/.config/tmux/tmux.conf
echo "Tmux installed and configured successfully."
