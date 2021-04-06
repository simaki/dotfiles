#!bin/sh -eu

cd $HOME
git clone https://github.com/simaki/dotfiles.git && cd dotfiles && git checkout sync

ln -fs $HOME/dotfiles/update.sh $HOME/update.sh
sh $HOME/dotfiles/brew/setup_brew.sh
find $HOME/dotfiles -type f -name setup.sh -exec sh "{}" \;
