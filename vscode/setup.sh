#!bin/sh -eu

echo '--- VSCode setup start ---'

brew install --cask visual-studio-code

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

ln -fs $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/
ln -fs $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/

while read line; do
  code --install-extension $line
done < extensions.txt

echo '--- VSCode setup end ---'
