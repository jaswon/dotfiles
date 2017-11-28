# aliases
alias ls='ls --color --group-directories-first'
alias lsa='ls -A'
alias lsl='ls -lh'
alias lsal='ls -Alh'
alias pls='sudo $(fc -ln -1)'
alias staticserver='python3 -m http.server'
# eval "$(hub alias -s)"

#functions
pom() { if [ -d .git ]; then git push origin master; fi; }

# exports
export EDITOR='vim'
export PS1="\[\e[1;36m\]\W \$ \[\e[m\]"
export LS_COLORS=$LS_COLORS:'di=1;44:'

. ~/.bash_prompt
