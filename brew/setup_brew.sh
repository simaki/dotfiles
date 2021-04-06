#!bin/sh -eu

cd `dirname $0`

echo "--- Homebrew setup start ---"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" && brew --version
xargs brew install < brew.txt
xargs brew tap < tap.txt
xargs brew install --cask < cask.txt

brew install cowsay && cowsay 'Hello, Homebrew!'

echo "--- Homebrew setup end ---"
