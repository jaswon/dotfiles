" set leader, disable substitute
let mapleader = "s"
map s <nop>

" edit rc
command! Rc :e $MYVIMRC

" no escape
inoremap jk <esc>
inoremap kj <esc>

runtime plugins.lua " plugin mgmt

runtime lsp.lua     " lsp
runtime editor.vim  " editor customization
runtime window.vim  " window mgmt
runtime motion.vim  " motion



" fzf
nnoremap <c-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --iglob ''!.git/'''
let g:fzf_action = { 'ctrl-n': 'top vsplit' }

" Commentary - note: <c-_> is ctrl+slash
nmap <c-_> <Plug>CommentaryLine
vmap <c-_> <Plug>Commentary

" clear highlight
noremap <leader><space> <Cmd>nohl<cr>

" open term
noremap <leader>t :vsplit term://$SHELL<cr>i
tnoremap jk <c-\><c-n>

" load machine specific configuration
if !empty(glob('~/.config/.vimrc'))
	source ~/.config/.vimrc
endif
