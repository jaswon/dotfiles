alias gpl='git pull'
alias gl='git log --graph --oneline'
alias gs='git status'
alias gsh='git show'
alias ga='git add'
alias gp='git push'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gca='git commit --amend --no-edit'

# prefer ydiff
if type ydiff >/dev/null; then
    alias gd='ydiff -s --wrap -w0'
else
    alias gd='git diff'
fi

function gr () { cd $(git rev-parse --show-toplevel); }
function gcm () { gr && git checkout master && git pull }
function gc () { git commit -m "$*" && git status }
function gmm () { gcm && gch - && git merge master; }
function gpo () { git push -u origin "$(git rev-parse --abbrev-ref HEAD)"; }
