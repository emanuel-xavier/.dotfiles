#!/bin/bash

apt install picom -y

rm -rf ~/.config/picom.conf 
ln -s $(pwd)/picom.conf ~/.config/picom.conf
