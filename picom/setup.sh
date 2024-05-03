#!/bin/bash

install_picom() {
    if [ -f /etc/arch-release ]; then
        sudo pacman -S picom --noconfirm
    elif [ -f /etc/os-release ] && grep -qi ubuntu /etc/os-release; then
        sudo apt install picom -y
    else
        echo "Unsupported distribution. Please install picom manually."
        exit 1
    fi
}

install_picom

rm -rf ~/.config/picom.conf
ln -s "$(pwd)/picom.conf" ~/.config/picom.conf
echo "Picom installed and configured successfully."
