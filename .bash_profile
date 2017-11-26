# aliases
alias ls='ls -AGC'
alias pls='sudo $(fc -ln -1)'
alias staticserver='python3 -m http.server'
# eval "$(hub alias -s)"

#functions
pom() { if [ -d .git ]; then git push origin master; fi; }

# exports
export EDITOR='vim'
export PS1="\[\e[1;36m\]\W \$ \[\e[m\]"

. ~/.bash_prompt
