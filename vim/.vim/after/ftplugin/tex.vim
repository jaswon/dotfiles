" latex stuff
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'

au BufNewFile *.tex :-1read $HOME/.vim/templates/tex
