# Petrosoft folders
alias ptsci='cd /home/emanuel/Petrosoft/science'
alias ptinfra='cd /home/emanuel/Petrosoft/science/infra'
alias ptgenesis='cd /home/emanuel/Petrosoft/science/genesis'
alias ptliferay='cd /home/emanuel/Petrosoft/liferay'

# nextcloud
alias nextcloud="/home/emanuel/AppImages/Nextcloud.AppImage"

# arduino
alias arduino="/opt/arduino-ide-2.1.0/arduino-ide"

# xrandr
alias display="echo ' \
  xrandr -> show displays\n \
  xrandr --output <eDP-1> --scale <1.5>x<1.5>'"

# neovim
alias vim="nvim"

# python
alias py="python3"

# Calc hours sum if its between 8AM and 6PM 
alias hcount="python3 /home/emanuel/Petrosoft/liferay/calcDays.py"

# Performance change

alias cpu='echo "
echo 0 > /sys/devices/system/cpu/cpu<NUMBER>/online
  - Number between 0 and 15

echo 1 > /sys/devices/system/cpu/cpu<NUMBER>/online
	- Number between 0 and 15

Command
# change freq
cpufreq-set --governor <governor_name>

# list freq
cpufreq-info | grep \"current CPU frequency\"


Options:
- Conservative: 
    The conservative governor adjusts the CPU frequency based on the CPU utilization 
    history. It aims to save power by gradually increasing or decreasing the frequency 
    depending on the workload. It avoids frequent changes in frequency to prevent 
    unnecessary power consumption.

- Ondemand: 
    The ondemand governor dynamically adjusts the CPU frequency based on the current CPU 
    utilization. It increases the frequency when the workload is high to provide better 
    performance and reduces  it when the workload is low to save power.

- Userspace: 
    The userspace governor allows the user or a program to manually set the CPU frequency. 
    It provides flexibility to adjust the frequency according to specific requirements or 
    policies defined by the user.

- Powersave: 
    The powersave governor keeps the CPU frequency at its lowest possible level to conserve 
    power. It prioritizes power efficiency over performance, making it suitable for scenarios 
    where power saving is the primary concern.

- Performance: 
    The performance governor keeps the CPU frequency at its maximum level all the time, 
    providing the best performance. It is suitable for scenarios where high-performance 
    computing is required, but it may consume more power.

- Schedutil: 
    The schedutil governor is a newer governor introduced in recent Linux kernels. It dynamically 
    adjusts the CPU frequency based on the CPU utilization and task scheduling information.  It 
    aims to strike a balance between performance and power consumption, adapting the frequency to 
    optimize for responsiveness and energy efficiency."'
