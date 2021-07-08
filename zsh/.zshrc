#!bin/sh -eu

setopt prompt_subst
show_branch() { git branch --show-current 2> /dev/null | sed -e 's/\(.*\)/:\1/'; }
PROMPT="%F{246}%c\$(show_branch)%f "

source ${$(readlink $HOME/.zshrc)%/*}/alias.sh
source ${$(readlink $HOME/.zshrc)%/*}/export.sh
if [ -e ~/.zshrc_private ]; then
  source ~/.zshrc_private
fi

# Add zsh completions
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
