# general helpers
alias ls='ls -Gp'
alias la='ls -A'
alias ll='ls -lh'
alias lal='ls -Alh'
alias pls='sudo $(fc -ln -1)'

# editor
function e () {
    if jobs 'e' &>/dev/null; then
        fg %'e'
    else
        $EDITOR $@
    fi
}

# ls after cd
function ls_after_cd () { ls }
chpwd_functions=(ls_after_cd)

# prompt
source ~/.zsh/prompt.zsh

# git conveniences
source ~/.zsh/git.zsh
