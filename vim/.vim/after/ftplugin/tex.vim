" latex stuff
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'

au BufNewFile *.tex :-1read $HOME/.vim/templates/tex

" enivornment shortcut
inoremap <buffer> ;env <esc>ciw\begin{<c-r>"}<cr><cr>\end{<c-r>"}<++><esc>ki<tab>

inoremap <buffer> ;m \(\) <++><esc>F\i
inoremap <buffer> ;M \[<cr><cr>\]<cr><cr><++><esc>3ki<tab>
inoremap <buffer> ;fa {\forall}
inoremap <buffer> ;ex {\exists}
