#!/bin/bash

cpu_temp=$(sensors | grep 'k10temp-pci-00c3' -A 3 | grep 'Tctl' | awk '{print $2}')

# Output the temperatures
echo "$cpu_temp"
