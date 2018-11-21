# exports - relog after editing
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR='nvim'
export LS_COLORS=$LS_COLORS:'di=1;44:'
export PATH=$PATH:/.local/bin:~/bin:~/code/go/bin:~/.gem/ruby/2.5.0/bin
export MOZ_USE_XINPUT2=1
export GOPATH=~/code/go

# start ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add
