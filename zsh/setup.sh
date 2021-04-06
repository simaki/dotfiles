#!bin/sh -eu

cd `dirname $0`

echo '--- zsh setup start ---'

ln -fs $HOME/dotfiles/zsh/.zshrc $HOME
ln -fs $HOME/dotfiles/zsh/.zprofile $HOME
ln -fs $HOME/dotfiles/zsh/.hushlogin $HOME
ln -fs $HOME/dotfiles/zsh/.git-completion.zsh $HOME

echo '--- zsh setup end ---'
