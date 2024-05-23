#!/bin/bash

add_folder_to_path() {
  export PATH="$PATH:$1"
}

PATHS_TO_ADD=( )

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

for i in "${PATHS_TO_ADD[@]}"; do
  add_folder_to_path "$i"
done

