return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use 'dstein64/vim-win'

  use 'easymotion/vim-easymotion'
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

  use 'neovim/nvim-lspconfig'
end)

