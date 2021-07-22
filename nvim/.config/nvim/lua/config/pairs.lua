local npairs = require('nvim-autopairs')

npairs.setup{
    check_ts = true,
}

_G.MUtils= {}
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
      return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end


vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
