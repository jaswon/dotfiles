# exports - relog after editing
export EDITOR='nvim'
export HISTCONTROL=ignoreboth:erasedups
export PYTHONDONTWRITEBYTECODE=1
export LS_COLORS=$LS_COLORS:'di=1;44:'
export PATH=$PATH:~/.local/bin:~/bin
export MOZ_USE_XINPUT2=1
export CDPATH="~/.cdpath"

[ -f ~/.config/.profile ] && . ~/.config/.profile

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

[ -f ~/.cargo/env ] && . ~/.cargo/env

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
    ssh-add
fi
