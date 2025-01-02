local nvim_lsp = require('lspconfig')

local servers = {
    gopls={},
    ts_ls={},
    pyright={},
    rust_analyzer={
        assist = {
            importGranularity = "module",
            importPrefix = "self",
        },
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
    },
}

for lsp, settings in pairs(servers) do
  nvim_lsp[lsp].setup {
    settings = { [lsp] = settings },
  }
end

local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'sp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'sn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<c-k>', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)

    vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(ev)
            vim.lsp.buf.format {async=false}
        end
    })

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { noremap=true, silent=true, buffer=ev.buf }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
    vim.keymap.set('n', 'gsd', '<cmd>vs | Telescope lsp_definitions<CR>', opts)

    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, opts)

    -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.keymap.set('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- vim.keymap.set('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  end,
})
