#!bin/sh -eu

echo '--- VSCode setup start ---'

# Shell Command: Install 'code' command in PATH https://code.visualstudio.com/docs/setup/mac
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

ln -fs $HOME/dotfiles/vscode/snippets/* $HOME/Library/Application\ Support/Code/User/snippets
ln -fs $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/
ln -fs $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/

while read line; do
  code --install-extension $line
done < extensions.txt

echo '--- VSCode setup end ---'
