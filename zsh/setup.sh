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
            curl gcc make mariadb-libs openssl zlib \
            libutil-linux bzip2 sqlite llvm ncurses \
            xz tk libffi xz python-openssl git zsh
    else
        echo "Unsupported distribution. Please install the required packages manually."
        exit 1
    fi

    echo "Required packages installed successfully."
}

install_packages
chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mkdir -p ~/.fonts
git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
fc-cache -vf

rm -rf ~/.zshrc
ln -s $(pwd)/.zshrc ~/.zshrc
