local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

lazy.setup({
  -- Colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

  -- Simple plugins
  "goolord/alpha-nvim",
  {
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    event = "InsertEnter"
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    version = "nightly", -- optional, updated every week. (see issue #1193)
    event = "BufEnter"
  },
  "akinsho/bufferline.nvim", -- Buffer line
  "moll/vim-bbye", -- Bbye allows you to do delete buffers (close files) 
                   -- without closing your windows or messing up your layout
  {
    "numToStr/Comment.nvim",
    event = "BufEnter"
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter"
  },
  "rmagatti/goto-preview", -- Preview window for definitions
  {
    "lukas-reineke/indent-blankline.nvim", -- Indents Balnklines
    event = "BufEnter",
  },
  {
    "nvim-lualine/lualine.nvim", -- Status line
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Icons for nvim-tree
    }
  },
  { -- Documentation generation
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    version = "*"
  },
  "ahmedkhalf/project.nvim", -- Project managment utils
  "akinsho/toggleterm.nvim", -- Plugin to persist and toggle multiple
  "Pocco81/true-zen.nvim", -- Focus mode
  "folke/which-key.nvim", -- Key bindings previes
  { -- Markdown Preview
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  "NvChad/nvim-colorizer.lua", -- Colorize hexes and color names
  "kdheepak/tabline.nvim",
  {
    "Exafunction/codeium.vim",
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function ()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
    end
  },
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- optional
    },
    version = "1.x.x", -- recommended
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  "nvim-telescope/telescope-media-files.nvim",

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    }
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "p00f/nvim-ts-rainbow",
  "JoosepAlviste/nvim-ts-context-commentstring",

  defaults = {
    lazy = true, -- every plugin is lazy-loaded by default
    version = "*", -- try installing the latest stable version for plugins that support semver
  },
})
