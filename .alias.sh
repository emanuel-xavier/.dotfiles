alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Copy current dir
alias ccd="pwd | xclip -sel clip"

# Petrosoft folders
alias ptsci='cd /home/emanuel/Petrosoft/science'
alias ptinfra='cd /home/emanuel/Petrosoft/science/infra'
alias ptgenesis='cd /home/emanuel/Petrosoft/science/genesis'
alias ptliferay='cd /home/emanuel/Petrosoft/liferay'

# Terminal navegation
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."

# Exit
alias :q="exit"

# setup monitor using 144hz refresh rate
alias monitor='xrandr --newmode "2560x1440_144.00"  586.50  2560 2760 3048 3536  1440 1443 1448 1525 -hsync +vsync \
                  && xrandr --addmode HDMI-A-1-0 "2560x1440_144.00" \
                  && xrandr --output HDMI-A-1-0 --mode "2560x1440_144.00" --right-of eDP-1 --auto --verbose'


# neovim
alias vim="nvim"


##########################
######## helper ##########
##########################

# keyboard
alias keyboard='echo "setxkbmap -model abnt2 -layout br"'

# cpu
alias cpu='echo "
echo 0 > /sys/devices/system/cpu/cpu<NUMBER>/online
  - Number between 0 and 15

echo 1 > /sys/devices/system/cpu/cpu<NUMBER>/online
	- Number between 0 and 15
'
