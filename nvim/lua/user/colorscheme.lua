----------------------
--  Material Setup  --
----------------------
-- local colorscheme = "material"
--
-- vim.g.material_style = "darker"

----------------------
--  Kanagawa Setup  --
----------------------
local colorscheme = "kanagawa"

local status_ok2, kanagawa = pcall(require, colorscheme)
if not status_ok2 then
  return
end

-- configure it
kanagawa.setup({
  undercurl = true,           -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true},
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true},
  specialReturn = true,       -- special highlight for the return keyword
  specialException = true,    -- special highlight for exception handling keywords
  transparent = false,        -- do not set background color
  dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
  globalStatus = false,       -- adjust window separators highlight for laststatus=3
  terminalColors = true,      -- define vim.g.terminal_color_{0,17}
  colors = {},
  overrides = {},
})

----------------------
-- Catppuccin Setup --
----------------------
-- local colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
--
-- local status_ok2, catppuccin = pcall(require, colorscheme)
-- if not status_ok2 then
--   return
-- end
--
-- -- configure it
-- catppuccin.setup({
--   dim_inactive = {
--     enabled = false,
--     shade = "dark",
--     percentage = 0.15,
--   },
--   transparent_background = false,
--   term_colors = false,
--   compile = {
--     enabled = false,
--     path = vim.fn.stdpath "cache" .. "/catppuccin",
--   },
--   styles = {
--     comments = { "italic" },
--     conditionals = { "italic" },
--     loops = {},
--     functions = {},
--     keywords = {},
--     strings = {},
--     variables = {},
--     numbers = {},
--     booleans = {},
--     properties = {},
--     types = {},
--     operators = {},
--   },
--   integrations = {
--     treesitter = true,
--     native_lsp = {
--       enabled = true,
--       virtual_text = {
--         errors = { "italic" },
--         hints = { "italic" },
--         warnings = { "italic" },
--         information = { "italic" },
--       },
--       underlines = {
--         errors = { "underline" },
--         hints = { "underline" },
--         warnings = { "underline" },
--         information = { "underline" },
--       },
--     },
--     coc_nvim = false,
--     lsp_trouble = false,
--     cmp = true,
--     lsp_saga = false,
--     gitgutter = false,
--     gitsigns = true,
--     leap = false,
--     telescope = true,
--     nvimtree = {
--       enabled = true,
--       show_root = true,
--       transparent_panel = false,
--     },
--     neotree = {
--       enabled = false,
--       show_root = true,
--       transparent_panel = false,
--     },
--     dap = {
--       enabled = false,
--       enable_ui = false,
--     },
--     which_key = false,
--     indent_blankline = {
--       enabled = true,
--       colored_indent_levels = false,
--     },
--     dashboard = true,
--     neogit = false,
--     vim_sneak = false,
--     fern = false,
--     barbar = false,
--     bufferline = true,
--     markdown = true,
--     lightspeed = false,
--     ts_rainbow = false,
--     hop = false,
--     notify = true,
--     telekasten = true,
--     symbols_outline = true,
--     mini = false,
--     aerial = false,
--     vimwiki = true,
--     beacon = true,
--   },
--   color_overrides = {},
--   highlight_overrides = {},
-- })

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
