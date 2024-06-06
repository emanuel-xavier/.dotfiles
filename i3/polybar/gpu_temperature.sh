#!/bin/bash

gpu_temp=$(sensors | grep 'amdgpu-pci-0300' -A 10 | grep 'edge' | awk '{print $2}' | tr -d '+°C')

# Output the temperatures
echo "$gpu_temp"
