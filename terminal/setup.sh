#!/bin/zsh -eu

terminal_profile=$(curl -L https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/terminal/One%20Light.terminal)
plutil -insert Window\ Settings.one-light -xml "$terminal_profile" ~/Library/Preferences/com.apple.Terminal.plist
defaults write com.apple.Terminal "Default Window Settings" -string "one-light"
defaults write com.apple.Terminal "Startup Window Settings" -string "one-light"
