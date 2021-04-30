#!bin/sh -eu

setopt prompt_subst
show_branch() { git branch --show-current 2> /dev/null | sed -e 's/\(.*\)/:\1/'; }
PROMPT="%F{246}%c\$(show_branch)%f "

source ${$(readlink $HOME/.zshrc)%/*}/alias.sh
source ${$(readlink $HOME/.zshrc)%/*}/export.sh
if [ -e ~/.zshrc_private ]; then
  source ~/.zshrc_private
fi

source $(brew --prefix)/Cellar/git/2.29.2/share/zsh/site-functions/git-completion.bash &> /dev/null
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"
# export PATH="/usr/local/sbin:$PATH"
