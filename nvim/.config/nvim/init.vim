" set leader, disable substitute
let mapleader = "s"
map s <nop>

set nocompatible
set hidden

" vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim  --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'tmsvg/pear-tree'
Plug 'spolu/dwm.vim'

call plug#end()

" fzf
nnoremap <c-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --iglob ''!.git/'''
let g:fzf_action = { 'ctrl-n': 'vsplit' }

" Commentary - note: <c-_> is ctrl+slash
nmap <c-_> <Plug>CommentaryLine
vmap <c-_> <Plug>Commentary

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <leader>h <Plug>(easymotion-h)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-l)

" Pear Tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

syntax on
filetype plugin indent on

set clipboard+=unnamedplus
set et sw=4 ts=4
set path+=**
set mouse=a
set wildmenu
set wildmode=longest,list,full
set completeopt=menuone
set number norelativenumber
set incsearch showmatch
set splitbelow splitright
set ignorecase smartcase
set gdefault
set backspace=indent,eol,start
set autowrite " write when make
set timeoutlen=200
set showcmd " show partial command in status
set backupcopy=yes
set statusline=[%n]\ %F%=[%l\ /\ %L,\ %02v]\  " buffer number and filename
set laststatus=2 " always show statusline
set conceallevel=0
set scrolloff=4

tnoremap jk <c-\><c-n>
inoremap jk <esc>

" cursorline for current pane only
highlight CursorLine cterm=NONE ctermbg=8
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" clear highlight
noremap <leader><space> <Cmd>nohl<cr>

" trailing whitespace
set list listchars=tab:\│\ ,trail:¬
hi Tabs ctermbg=NONE ctermfg=DarkGrey guibg=NONE guifg=DarkGrey
hi Whitespace ctermbg=NONE ctermfg=Red guibg=NONE guifg=Red
augroup Tabs
	au!
	au VimEnter,WinEnter,BufWinEnter * match Tabs /\t/
" match Whitespace /\s\+$/
augroup END

" open term
noremap <leader>t :vsplit term://bash<cr>i

" load machine specific configuration
if !empty(glob('~/.config/.vimrc'))
	source ~/.config/.vimrc
endif

