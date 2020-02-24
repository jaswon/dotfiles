# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls='ls -Gp'
alias la='ls -A'
alias ll='ls -lh'
alias lal='ls -Alh'
alias pls='sudo $(fc -ln -1)'
alias serve='python3 -m http.server'
alias se='sudoedit'
alias z='zathura'
alias math='python -ic "from math import *; import numpy as np"'
alias unix='date -r'

# disable xon/xoff
stty -ixon

# functions
randhex() { cat /dev/urandom | head -c $1 | hexdump -ve '/1 "%02x"'; }
e () {
	if [ $# -eq 0 ]; then
		if jobs '$EDITOR' &>/dev/null; then
			fg
		else
			$EDITOR
		fi
	else
		$EDITOR "$@"
	fi
}
workon () { venv=$(pipenv --venv 2>/dev/null) && source .env && source "$venv/bin/activate" || echo "no venv"; }
cd () { builtin cd "$@" && ls; }
todo () { git grep -I 'TODO:'; }
rg () {
	if [ -t 1 ]; then
		command rg -p "$@" | less -RFX
	else
		command rg "$@"
	fi
}

# git conveniences
gcm () { cd $(git rev-parse --show-toplevel) && git checkout master && git pull; }
ga () { git add "$@" && git status; }
gc () { git commit -m "$*" && git status; }
gca () { git commit --amend --no-edit && git status; }
gs () { git status; }
gsh () { git show; }
gch () { cd $(git rev-parse --show-toplevel) && git checkout "$@"; }
gcb () { git checkout -b "$@"; }
gmm () { gcm && gch - && git merge master; }
gp () { git push; }
gpo () { git push -u origin "$(git rev-parse --abbrev-ref HEAD)"; }
alias gpl='git pull'
alias gd='ydiff -s --wrap -w0'
alias gl='git log --graph --oneline'

if $(hash __git_complete 2>/dev/null); then
	__git_complete ga _git_add
	__git_complete gch _git_checkout
	__git_complete gp _git_push
fi

# prompt
. ~/.prompt
