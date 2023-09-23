#!/bin/bash

add_folder_to_path() {
  export PATH="$PATH:$1"
}

PATHS_TO_ADD=( "/home/emanuel/.go/bin"    \
               "/home/emanuel/.nvim/bin"  \
               "/home/emanuel/.cargo/bin" )

for i in "${PATHS_TO_ADD[@]}"; do
  add_folder_to_path "$i"
done

