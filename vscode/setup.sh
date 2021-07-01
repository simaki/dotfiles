#!bin/sh -eu

echo '--- VSCode setup start ---'

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

ln -fs $HOME/dotfiles/vscode/snippets/* $HOME/Library/Application\ Support/Code/User/snippets
ln -fs $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/
ln -fs $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/

while read line; do
  code --install-extension $line
done < extensions.txt

echo '--- VSCode setup end ---'
