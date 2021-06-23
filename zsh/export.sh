#!bin/sh -eu

export GITHUB_USER=simaki
export LC_ALL=en_US.UTF-8
export DOTFILES='~/dotfiles'
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/dotfiles/cpp
export PYTHON_VERSION='3.9'
export BAT_THEME='GitHub'

export PATH="$(brew --prefix)/opt/gettext/bin:$PATH"
export PATH="$(brew --prefix)/bin:$PATH"
export PATH="$(brew --prefix)/bin/python@${PYTHON_VERSION}:$PATH"
export PATH="$(brew --prefix)/Cellar/python@${PYTHON_VERSION}:$PATH"
