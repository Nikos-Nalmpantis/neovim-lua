--[[
  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
Neovim init file
Version: 0.0.1 - 2021/09/20
Maintainer: nikosNalmpantis
Website: https://github.com/nikosNalmpantis/neovim-lua
--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('plugins')              -- plugins
require('options')              -- basic settings
require('keymaps')              -- keymaps
require('theme-config')         -- theme
require('lualine-config')       -- statusline
require('bufferline-config')    -- bufferline
require('treesitter-config')    -- treesitter
require('autopairs-config')     -- autopairs
require('cmp-config')           -- cmp settings
require('rnvimr-config')        -- ranger interface
-- require('lsp-config')           -- LSP settings
