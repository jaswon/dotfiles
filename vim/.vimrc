" set leader, disable substitute
let mapleader = "s"
map s <nop>

set nocompatible
set hidden

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'

Plug 'spolu/dwm.vim'

Plug 'w0rp/ale'

Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript' ] }
Plug 'mxw/vim-jsx', { 'for': [ 'javascript.jsx' ] }
Plug 'vim-python/python-syntax', { 'for': [ 'python' ] }
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript' ] }

call plug#end()

let g:javascript_plugin_flow = 1

" ALE
let g:ale_linters_explicit = 1
let g:ale_linters = {
	\ "javascript": [ 'eslint', 'flow', 'flow-language-server' ],
	\ "typescript": [ 'eslint', 'tsserver' ],
	\ "go": [ 'go build', 'golint', 'gopls' ],
	\ "python": [ 'pylint', 'pyls', 'mypy' ],
	\}
let g:ale_fixers = {
	\ "javascript": [ 'prettier' ],
	\ "typescript": [ 'prettier' ],
	\ "scss": [ 'prettier' ],
	\ "go": [ 'gofmt' ],
	\ "python": [ 'black', 'isort' ],
	\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 0

let g:ale_python_pylint_options = '-E -j0'

nmap <silent> <leader>n <Plug>(ale_next_wrap)
nmap <silent> <leader>p <Plug>(ale_previous_wrap)

nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gsd <Plug>(ale_go_to_definition_in_vsplit)
nmap <silent> gr <Plug>(ale_find_references)
nmap <silent> <s-k> <Plug>(ale_hover)

" fzf
nnoremap <c-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --iglob ''!.git/'''
let g:fzf_action = { 'ctrl-n': 'vsplit' }

" expand pairs
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap ' ''<esc>i

" Vim Sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
	\ {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
	\ {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
	\ {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
	\ {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
	\ {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
	\ {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
	\ ]

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

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

syntax on
filetype plugin indent on

" tabbing setup
set ts=4 sw=4 sts=0 ai

au Filetype markdown setl et sts=4
au Filetype javascript.jsx setl et
au Filetype scss setl et

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

" exit insert mode
inoremap jk <esc>
inoremap kj <esc>

" file save
nnoremap ,, <Cmd>write<cr>

" open term
noremap <leader>t <Cmd>vsp \| term <cr>i

" load machine specific configuration
if !empty(glob('~/.config/.vimrc'))
	source ~/.config/.vimrc
endif
