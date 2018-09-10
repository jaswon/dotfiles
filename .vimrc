" set leader, disable substitute
let mapleader = "s"
map s <nop>

set nocompatible

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'spolu/dwm.vim'

Plug 'autozimu/LanguageClient-neovim', { 'branch':'next', 'do': 'bash install.sh' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'mattn/emmet-vim', { 'for': [ 'javascript.jsx', 'html', 'xml' ] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript.jsx'] }

call plug#end()

" vim-js
let g:javascript_plugin_flow = 1

" fzf

function! s:open_dwm(file)
	if exists("*DWM_New")
		call DWM_New()
	endif
	exe "edit" a:file[0]
endfunction
let g:fzf_action = {
\ 'ctrl-n': function('s:open_dwm'),
\ 'enter': 'edit' }

function! s:find_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

command! -bang -nargs=* ProjectFiles call fzf#run(fzf#wrap({
\ 'source':  'rg --files',
\ 'dir':     s:find_git_root(),
\ 'options': '--color=dark,hl:46,hl+:46 --prompt "ProjectFiles> "'
\}))
nnoremap <c-p> :ProjectFiles<cr>
nnoremap \ :Rg<space>

" LSP
set hidden
let g:LanguageClient_serverCommands = {
\ "javascript.jsx": [ 'flow-language-server', '--stdio', '--try-flow-bin' ],
\ "go": [ 'go-langserver' ],
\}
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>

" ALE
let g:ale_linters_explicit = 1
let g:ale_linters = {
\ "javascript": ['flow'],
\ "go": ['gofmt', 'go build'],
\}
let g:ale_fixers = {
\ "javascript": ['prettier'],
\ "scss": ['prettier'],
\ "go": ['gofmt'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_javascript_prettier_use_local_config = 1

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

" Emmet
imap ;; <plug>(emmet-expand-abbr)

" latex stuff
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'

syntax on
filetype plugin indent on

" tabbing setup
function! TabSetup ()
  set tabstop=2
  set softtabstop=0
  set noexpandtab
  set shiftwidth=2
  set autoindent
endfunction

call TabSetup()

" tabbing for Markdown
au Filetype markdown setl ts=4 sts=4 sw=4 et

" tabbing for jsx
au Filetype javascript.jsx setl et sw=4 ts=4

" tabbing for sass
au Filetype scss setl et sw=4 ts=4

set path+=**
set wildmenu
set wildmode=longest,list,full
set number norelativenumber
set incsearch showmatch
set splitbelow splitright
set ignorecase smartcase
set gdefault
set backspace=indent,eol,start
set autowrite " write when make
set timeoutlen=150
set showcmd " show partial command in status
set background=dark
set backupcopy=yes
set statusline=[%n]\ %F "buffer number and filename
set laststatus=2 " always show statusline
set mouse=a

" cursorline for current pane only
highlight CursorLine cterm=NONE ctermbg=8
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" clear highlight
noremap <leader><space> :nohl<cr>

" trailing whitespace
set list listchars=tab:\ \ ,trail:¬
hi Whitespace ctermbg=NONE ctermfg=Red guibg=NONE guifg=Red

" exit insert mode
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>

" placeholder navigation - go to next <++>
inoremap <space><tab> <esc>/<++><cr>"_c4l
nnoremap <space><tab> /<++><cr>"_c4l

" disable arrow keys
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>

" new file templates
au BufNewFile *.tex :-1read $HOME/.vim/templates/tex
au BufNewFile *.html :-1read $HOME/.vim/templates/html
