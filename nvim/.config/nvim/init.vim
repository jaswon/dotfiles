" set leader, disable substitute
let mapleader = "s"
map s <nop>

" edit rc
command! Rc :e $MYVIMRC

" no escape
inoremap jk <esc>
inoremap kj <esc>

lua require("plugins")
lua require("lsp")
lua require('config.telescope')
lua require('config.treesitter')

runtime editor.vim     " editor customization
runtime window.vim     " window mgmt
runtime motion.vim     " motion

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
