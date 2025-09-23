#!/usr/bin/env bash

cpu_temp=$(sensors | grep 'k10temp-pci-00c3' -A 3 | grep 'Tctl' | awk '{print $2}' | tr -d '+°C')

# Output the temperatures
echo "$cpu_temp"
