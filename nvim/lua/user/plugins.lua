local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons" -- Icons for nvim-tree
  use "kyazdani42/nvim-tree.lua" -- Directory tree
  use "Pocco81/true-zen.nvim" -- Focus mode
  use "f-person/git-blame.nvim" -- Git Blame
  use({ -- Markdown Preview
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use { -- Documentation generation
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    tag = "*"
  }
  use "rmagatti/goto-preview" -- Preview window for definitions
  use "akinsho/bufferline.nvim" -- Buffer line
  use "moll/vim-bbye" -- Bbye allows you to do delete buffers (close files) 
                      -- without closing your windows or messing up your layout.
  use "nvim-lualine/lualine.nvim" -- Status line
  use "akinsho/toggleterm.nvim" -- Plugin to persist and toggle multiple 
                                -- terminals during an editing session
  use "ahmedkhalf/project.nvim" -- Project managment utils
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules in Neovim 
                                 -- to improve startup time.
  use "lukas-reineke/indent-blankline.nvim" -- Indents Balnklines
  use "goolord/alpha-nvim" -- A Lua powered greeter
  use "folke/which-key.nvim" -- Key bindings previes

  -- Colorschemes
  use "rebelot/kanagawa.nvim"
  -- use "lunarvim/darkplus.nvim"
  -- use "marko-cerovac/material.nvim"
 --  use({
	-- "catppuccin/nvim",
	-- as = "catppuccin",
 --    run = ":CatppuccinCompile"
 --  })

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- Cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- Snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- A bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- Simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- For formatters and linters
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
