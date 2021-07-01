#!bin/sh -eu

# To enable key-repeating execute the following in your Terminal and restart VS Code:
# https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

ln -fs $HOME/dotfiles/vscode/snippets/* $HOME/Library/Application\ Support/Code/User/snippets
ln -fs $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/
ln -fs $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/

while read line; do
  code --install-extension $line
done < extensions.txt

echo '--- VSCode setup end ---'
