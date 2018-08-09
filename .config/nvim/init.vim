set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set clipboard+=unnamedplus

tnoremap jk <c-\><c-n>

command Vterm vsplit term://bash
command Xterm split term://bash
