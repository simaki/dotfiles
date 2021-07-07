#!bin/sh -eu

export BAT_THEME='GitHub'
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/dotfiles/cpp
export DOTFILES='~/dotfiles'
export GITHUB_USER=simaki
export LC_ALL=en_US.UTF-8
export PYTHON_VERSION='3.9'

export PATH="$(brew --prefix)/opt/gettext/bin:$PATH"
export PATH="$(brew --prefix)/bin:$PATH"
# export PATH="$(brew --prefix)/bin/python@${PYTHON_VERSION}:$PATH"
export PATH="$(brew --prefix)/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
export PATH="$(brew --prefix)/Cellar/python@${PYTHON_VERSION}:$PATH"
