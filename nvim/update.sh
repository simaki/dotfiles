#!bin/sh -eu

nvim +'PlugUpgrade | PlugUpdate | qa' &> /dev/null
nvim +'CocUpdateSync | qa' &> /dev/null
