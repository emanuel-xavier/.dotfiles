#!/bin/bash

apt install xserver-xorg-input-libinput

ln -s ./50-synaptics.conf /etc/x11/xorg.conf.d/50-synaptics.conf
