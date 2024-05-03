#!/bin/bash

install_xorg_input_lib() {
  if [ -f /etc/os-release ] && grep -qi ubuntu /etc/os-release; then
    sudo apt install -y xserver-xorg-input-libinput

    elif [ -f /etc/arch-release ]; then
        sudo pacman -S --needed xf86-input-libinput
          
    else
        echo "Unsupported distribution. Please install the required packages manually."
        exit 1
    fi
}

install_xorg_input_lib
ln -s ./50-synaptics.conf /etc/x11/xorg.conf.d/50-synaptics.conf
