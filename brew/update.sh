#!bin/sh -eu

echo "--- Homebrew update start ---"

brew update --quiet
brew upgrade --quiet

echo "--- Homebrew update end ---"
