#!bin/sh -eu

alias ls='ls -FG'
alias mv='mv -i'
alias cp='cp -i'
alias ll='rm .DS_Store &>/dev/null; ls -alG'
alias sourcerc='source ~/.zshrc'

alias vimf='nvim $(find . -type d -maxdepth 5 -not -path "*/.git/*" 2> /dev/null | fzf || echo .)'
alias lsf='ls $(find . -type d -maxdepth 5 -not -path "*/.git/*" 2> /dev/null | fzf || echo .)'
alias cdf='cd $(find . -type d -maxdepth 5 -not -path "*/.git/*" 2> /dev/null | fzf || echo .)'
alias historyf="history | cut -c 8- 2> /dev/null | fzf | pbcopy"

alias vim='nvim'
alias chrome="open -a 'Google Chrome'"

alias python='python3'
alias py='python3'
alias pip='python3 -m pip'
alias jlab='jupyter-lab'

alias latex-which='kpsewhich'
alias latex-package='tlmgr'
alias latex-update='sudo mktexlsr'

if [[ $(uname) = "Darwin" ]]; then
  >&2 alias strace='echo "strace is not on $(uname). Use dtruss"'
fi
