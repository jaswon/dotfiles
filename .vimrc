set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'Syntastic'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Auto-pairs'
Plugin 'SirVer/ultisnips' 
Plugin 'honza/vim-snippets'
Plugin 'commentary.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
call vundle#end()

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set backspace=2

set autochdir
set path+=**
set wildmenu
set relativenumber
set hls
set is

noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" clear last search
nnoremap <enter> :noh<return><esc>

syntax on

let g:sparkup = 'bundle/sparkup/sparkup.py'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:tex_flavor = 'latex'

" lightline config
let g:lightline = {
	\ 'colorscheme': 'seoul256'
	\ }


augroup mdCompileOnSave
	autocmd!
	autocmd BufWritePost *.md !pandoc -o <afile>:r.pdf <afile>
augroup END
