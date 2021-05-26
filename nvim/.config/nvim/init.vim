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

Plug 'dstein64/vim-win'

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

" edit rc
command! Rc :e $MYVIMRC

" window mgmt
function! ReflowWindows(dir)
    let win = winnr()
    exe 'windo wincmd ' . a:dir
    exe win . ' wincmd w'
endfunction

map <c-w> <plug>WinWin
let g:win_ext_command_map = {
    \ "\<cr>": 'Win#exit',
    \ 'c': 'wincmd c',
    \ 'C': 'quit!',
    \ 'n': 'top vne',
    \ 'H': 'wincmd H',
    \ 'J': 'wincmd J',
    \ 'K': 'wincmd K',
    \ 'L': 'wincmd L',
    \ '-': 'call ReflowWindows("J")',
    \ '|': 'call ReflowWindows("L")',
    \ 'm': 'call ReflowWindows("J") | wincmd H',
    \ }

" vim-lsp
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=auto
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gsd :leftabove vertical LspDefinition<cr>
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> grn <plug>(lsp-rename)
    nmap <buffer> sp <plug>(lsp-previous-diagnostic)
    nmap <buffer> sn <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.py,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" fzf
nnoremap <c-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --iglob ''!.git/'''
let g:fzf_action = { 'ctrl-n': 'top vsplit' }

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
map <leader>h <Plug>(easymotion-linebackward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)

" quickfix
aug QFClose
    au!
    au FileType qf nmap <buffer> <cr> :exe "wincmd p \| cc " . line('.') . " \| cclose"<cr>
    au FileType qf nmap <buffer> <c-n> :exe "wincmd p \| leftabove vne \| cc " . line('.') . "\| cclose"<cr>
aug END

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

" no escape
inoremap jk <esc>
inoremap kj <esc>

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
noremap <leader>t :vsplit term://$SHELL<cr>i
tnoremap jk <c-\><c-n>

" load machine specific configuration
if !empty(glob('~/.config/.vimrc'))
	source ~/.config/.vimrc
endif

