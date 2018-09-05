# aliases
alias ls='ls --color --group-directories-first'
alias la='ls -A'
alias ll='ls -lh'
alias lal='ls -Alh'
alias pls='sudo $(fc -ln -1)'
alias http='python3 -m http.server'
alias e='$EDITOR'
alias se='sudoedit'
alias z='zathura'
alias math='python -ic "from math import *"'

# tab complete
bind TAB:complete

# virtualenvs
alias ctf='cd ~/dev/ctf && source ~/env/ctf/bin/activate'

# disable xon/xoff
stty -ixon

# functions
cd () { builtin cd "$@" && ls; }

# prompt
. ~/.prompt
