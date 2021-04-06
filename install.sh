#!bin/sh -eu

cd $HOME
git clone https://github.com/simaki/dotfiles.git
ln -fs $HOME/dotfiles/update.sh $HOME/update.sh
sh $HOME/dotfiles/brew/setup_brew.sh
find $HOME/dotfiles -type f -name setup.sh -exec sh "{}" \;
