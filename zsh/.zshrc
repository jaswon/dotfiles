# refer: /usr/share/zsh/manjaro-zsh-config

export EDITOR=nvim

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# history options
setopt SHARE_HISTORY # share history across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500

# keybindings
bindkey -e
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# word boundaries
WORDCHARS=${WORDCHARS//[-&.;]}

# disable xon/xoff
stty -ixon

# general helpers
alias ls='ls -Gp'
alias la='ls -A'
alias ll='ls -lh'
alias lal='ls -Alh'
alias pls='sudo $(fc -ln -1)'

# editor
function e () {
    if [ $# -eq 0 ]; then
        if jobs '$EDITOR' &>/dev/null; then
            fg %'$EDITOR'
        else
            $EDITOR
        fi
    else
        $EDITOR "$@"
    fi
}

# ls after cd
function cd_ls () { ls }
chpwd_functions=(cd_ls)

# prompt
[[ -f ~/etc/prompt.zsh ]] && source ~/etc/prompt.zsh

# git conveniences
[[ -f ~/etc/git.zsh ]] && source ~/etc/git.zsh
