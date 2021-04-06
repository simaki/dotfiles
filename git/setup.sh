#!bin/sh -eu

cd `dirname $0`

ln -fs $HOME/dotfiles/git/.gitconfig $HOME

touch $HOME/.gitignore_global
curl -fsS https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore >> $HOME/.gitignore_global
curl -fsS https://raw.githubusercontent.com/github/gitignore/master/Global/Vim.gitignore >> $HOME/.gitignore_global
curl -fsS https://raw.githubusercontent.com/github/gitignore/master/Global/VisualStudioCode.gitignore >> $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global
