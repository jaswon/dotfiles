# aliases
alias ls='ls --color --group-directories-first'
alias la='ls -A'
alias ll='ls -lh'
alias lal='ls -Alh'
alias pls='sudo $(fc -ln -1)'
alias http='python3 -m http.server'
alias e='$EDITOR'
alias z='zathura'
alias math='python -ic "from math import *"'

# functions
cd () { builtin cd "$@" && ls; }

# prompt
. ~/.prompt
