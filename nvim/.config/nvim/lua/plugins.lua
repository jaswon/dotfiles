return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
    }

    -- LSP config
    use 'neovim/nvim-lspconfig'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- Hop
    use {
        'phaazon/hop.nvim',
        as = 'hop',
    }

    -- Pairs
    use 'windwp/nvim-autopairs'

    -- Window mgmt
    use 'dstein64/vim-win'

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
end)

