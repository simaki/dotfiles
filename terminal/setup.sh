#!/bin/sh -eu

terminal_profile=$(curl -L https://raw.githubusercontent.com/lysyi3m/macos-terminal-themes/master/themes/Github.terminal)
plutil -insert Window\ Settings.github-theme -xml "$terminal_profile" ~/Library/Preferences/com.apple.Terminal.plist
defaults write com.apple.Terminal "Default Window Settings" -string "github-theme"
defaults write com.apple.Terminal "Startup Window Settings" -string "github-theme"
