#!bin/sh

# Preferences > General > Show scroll bars: `Automatic`, `WhenScrolling`, `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

# Preferences > Keyboard > Text: DISABLE Correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Preferences > Keyboard > Text: DISABLE Capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Preferences > Keyboard > Text: DISABLE Add period with double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Preferences > Keyboard > Text: DISABLE Use smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Preferences > Keyboard > Text: DISABLE Use smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Preferences > Mission Controll > Mission Controll: DISABLE Automatically rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Preferences > Trackpad > Point & Click: Fastest racking speed
defaults write -g com.apple.trackpad.scaling 3

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# 
defaults write -g NSWindowResizeTime -float 0.001

# Finder - Set Desktop as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
# Finder - Enable "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false

# TextEdit.app > Preferences > Format: "Plain text"
defaults write com.apple.TextEdit RichText -int 0

# Finder > Preferences > Advanced > ENABLE Show all filename extensions
defaults write -g AppleShowAllExtensions -bool true
