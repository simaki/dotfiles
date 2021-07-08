#!/bin/sh -eu

find $HOME/dotfiles -mindepth 2 -type f -name update.sh -exec sh {} \;
