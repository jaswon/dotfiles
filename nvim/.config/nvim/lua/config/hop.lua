require('hop').setup()

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', ' ', '<cmd>HopWord<cr>', opts)
map('v', ' ', '<cmd>HopWord<cr>', opts)
