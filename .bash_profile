if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

#functions
pom() { if [ -d .git ]; then git push origin master; fi; }

# exports
export EDITOR='vim'
export PS1="\[\e[1;36m\]\W \$ \[\e[m\]"
