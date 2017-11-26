" set leader, disable substitute
let mapleader = "s"
map s <nop>

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
call vundle#end()

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" gui setup
set guifont=Operator\ Mono\ Light:h13

" latex stuff
let g:tex_flavor="latex"
autocmd Filetype tex setlocal errorformat=%f:%l:\ %m makeprg=latex\ -interaction=nonstopmode\ -file-line-error\ -output-format=pdf\ %

filetype plugin indent on

" tabbing setup
function! TabSetup ()
  set tabstop=2
  set softtabstop=0
  set expandtab
  set shiftwidth=2
  set autoindent
endfunction

call TabSetup()

set path+=**
set wildmenu
set number relativenumber
set incsearch showmatch hlsearch
set splitbelow splitright
set ignorecase smartcase
set gdefault
set backspace=indent,eol,start
set autowrite " write when make
set timeoutlen=500
set showcmd " show partial command in status 

" copy to clipboard
map <Leader>c "*y

" exit insert mode
inoremap jj <esc>
inoremap <esc> <nop>

" clear search
nnoremap <silent> <leader><space> :nohl<CR>

" tab complete
" imap <Tab> <c-p>

" split nav
" nnoremap <c-h> <c-w>h
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-l> <c-w>l

" disable arrow keys
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>

syntax on
