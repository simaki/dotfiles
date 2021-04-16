#!bin/sh -eu

cd `dirname $0`

echo "--- Homebrew setup start ---"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" && brew --version

brew install cowsay && cowsay 'Hello, Homebrew!'
brew bundle

echo "--- Homebrew setup end ---"
