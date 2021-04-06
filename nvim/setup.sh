#!bin/sh -eu

cd `dirname $0`

echo "--- Neovim setup start ---"

brew install neovim && brew upgrade neovim && nvim --version

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall | PlugUpdate | PlugClean! | qa' &> /dev/null

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/ftplugin
mkdir -p $HOME/.config/nvim/template
ln -fs $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim
ln -fs $HOME/dotfiles/nvim/ftplugin/* $HOME/.config/nvim/ftplugin

echo "--- Neovim setup end ---"
