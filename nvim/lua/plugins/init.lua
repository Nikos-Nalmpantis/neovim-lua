return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'

    use 'p00f/nvim-ts-rainbow'

    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    --use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    --use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use 'kevinhwang91/rnvimr'

    use 'preservim/nerdcommenter'

    use "onsails/lspkind-nvim"

    use "github/copilot.vim"

    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn['mkdp#util#install']() end,
      ft = {'markdown'}
    }

    -- Fuzzy path completion
    use 'hrsh7th/cmp-path'

    use {'romgrk/fzy-lua-native', run = 'make'}
    use {'tzachar/fuzzy.nvim', requires = {'romgrk/fzy-lua-native'}}
    use {'tzachar/cmp-fuzzy-path', requires = {'hrsh7th/nvim-cmp', 'hrsh7th/cmp-path', 'tzachar/fuzzy.nvim'}}
    use {'tzachar/cmp-fuzzy-buffer', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}

    -- Themes
    -- use 'KeitaNakamura/neodark.vim'
    use({
      "catppuccin/nvim",
      as = "catppuccin"
    })
end)
