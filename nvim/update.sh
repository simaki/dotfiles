#!bin/sh -eu

echo "--- Neovim update start ---"

nvim +'PlugUpgrade | PlugUpdate | PlugClean! | CocUpdate | qa' &> /dev/null

echo "--- Neovim update end ---"
