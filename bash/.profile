# exports - relog after editing
export EDITOR='nvim'
export LS_COLORS=$LS_COLORS:'di=1;44:'
export PATH=$PATH:~/.local/bin:~/bin
export MOZ_USE_XINPUT2=1
export CDPATH="~/.cdpath"

[ -f ~/.config/.profile ] && . ~/.config/.profile

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# start ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

case $(uname) in
	Linux) ssh-add ;;
	Darwin) ssh-add -A ;;
esac
