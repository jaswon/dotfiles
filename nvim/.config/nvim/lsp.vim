" vim-lsp

let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_format_sync_timeout = 100
let g:lsp_document_code_action_signs_enabled = 0

let g:lsp_settings = {
    \ 'gopls': {
        \ 'initialization_options': {
            \ 'experimentalWorkspaceModule': v:true,
            \ }
        \ }
    \ }

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=auto
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gsd :leftabove vertical LspDefinition<cr>
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> grn <plug>(lsp-rename)
    nmap <buffer> sp <plug>(lsp-previous-diagnostic)
    nmap <buffer> sn <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    autocmd! BufWritePre <buffer> call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" quickfix
aug QFClose
    au!
    au FileType qf nmap <buffer> <cr> :exe "wincmd p \| cc " . line('.') . " \| cclose"<cr>
    au FileType qf nmap <buffer> <c-n> :exe "wincmd p \| leftabove vne \| cc " . line('.') . "\| cclose"<cr>
aug END
