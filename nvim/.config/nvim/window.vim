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
