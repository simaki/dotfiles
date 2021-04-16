#!bin/sh -eu

cd `dirname $0`

ignore=$HOME/dotfiles/git/ignore
touch $ignore
curl -fsS https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore >> $ignore
curl -fsS https://raw.githubusercontent.com/github/gitignore/master/Global/Vim.gitignore >> $ignore
curl -fsS https://raw.githubusercontent.com/github/gitignore/master/Global/VisualStudioCode.gitignore >> $ignore

ln -fs $ignore $HOME/.config/git
