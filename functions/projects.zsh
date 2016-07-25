#!/bin/zsh

: ${PROJECTS_DIR:=/projects}

unknown_project () {
  echo "\033[337;41m\nThe name of the project is required!\n\033[0m";
}

p() {
  if [ ! $1 ]; then
    unknown_project
    return 1
  fi
  
  cd $PROJECTS_DIR/$1
}

p_comp() {
    _alternative "dirs:project dirs:_path_files -W ${PROJECTS_DIR}"
}

compdef p_comp p
