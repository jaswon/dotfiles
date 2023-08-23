local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local sorters = require('telescope.sorters')

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        mappings = {
            i = {
                ["<c-j>"] = actions.move_selection_next,
                ["<c-k>"] = actions.move_selection_previous,
            },
        },
    },
    pickers = {
        git_files = {
            show_untracked = true,
        },
    },
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

_G.project_files = function()
  local opts = {}
  local ok = pcall(builtin.git_files, opts)
  if not ok then builtin.find_files(opts) end
end

map('n', '<c-p>', '<cmd>call v:lua.project_files()<cr>', opts)
map('n', '\\', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<tab>', '<cmd>Telescope buffers<cr>', opts)
