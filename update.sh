#!bin/sh -eu

date
find $HOME/dotfiles -mindepth 2 -type f -name update.sh -exec sh {} \;
date
