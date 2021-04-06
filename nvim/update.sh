#!bin/sh -eu

echo "--- Neovim update start ---"

nvim +'PlugUpgrade | PlugUpdate | PlugClean! | qa' &> /dev/null

echo "--- Neovim update end ---"
