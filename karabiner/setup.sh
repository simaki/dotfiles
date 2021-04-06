#!bin/sh -eu

cd `dirname $0`

echo '--- Karabiner setup start ---'

ln -fs $HOME/dotfiles/karabiner/karabiner.json $HOME/.config/karabiner

echo '--- Karabiner setup end ---'
