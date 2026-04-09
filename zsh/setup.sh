#!/bin/bash

install_packages() {
    if [ -f /etc/os-release ] && grep -qi ubuntu /etc/os-release; then
        sudo apt install -y curl gcc make default-libmysqlclient-dev libssl-dev \
            zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm \
            libncurses5-dev libncursesw5-dev \
            xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git \
            zsh
    elif [ -f /etc/arch-release ]; then
        sudo pacman -S --needed \
            git zsh ttf-jetbrains-mono-nerd fzf
    else
        echo "Unsupported distribution. Please install the required packages manually."
        exit 1
    fi

    echo "Required packages installed successfully."
}

install_packages
chsh -s /bin/zsh

ln -s $(pwd)/.zshrc ~/.zshrc
