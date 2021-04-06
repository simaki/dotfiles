#!bin/sh -eu

cd `dirname $0`

echo '--- Aspell setup start ---'

ln -fs $HOME/dotfiles/aspell/.aspell.en.pws $HOME

echo '--- Aspell setup end ---'
