#!/usr/bin/env bash

install_neovim() {
  if [ -f /etc/arch-release ]; then
    sudo pacman -S --needed neovim 
  fi
}

install_neovim

rm -rf /home/$USER/.config/nvim
ln -s $(pwd) /home/$USER/.config/nvim
