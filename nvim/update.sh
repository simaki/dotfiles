#!bin/sh -eu

echo "--- Neovim update start ---"

nvim +'PlugUpgrade | PlugUpdate | qa' &> /dev/null
nvim +'CocUpdateSync | qa' &> /dev/null

echo "--- Neovim update end ---"
