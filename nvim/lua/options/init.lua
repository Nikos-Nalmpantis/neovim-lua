-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd     		            -- execute Vim commands
local exec = vim.api.nvim_exec 	            -- execute Vimscript
local fn = vim.fn       		            -- call Vim functions
local g = vim.g         		            -- global variables
local opt = vim.opt         	            -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','             -- change leader to a comma
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
-- opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.relativenumber = true     -- show relative line number
opt.showmatch = true          -- highlight matching parenthesis
-- opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.colorcolumn = '80,120'    -- line lenght marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern

-- remove whitespace on save
cmd[[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight
opt.undofile = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
opt.softtabstop = 4
opt.showtabline = 2

-- don't auto commenting new lines
cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd[[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd[[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = '|'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
cmd[[autocmd FileType markdown let g:indentLine_enabled=0]]


cmd('filetype plugin indent on')
opt.shortmess = vim.o.shortmess .. 'c'
opt.autoindent = true
opt.conceallevel = 0
opt.cursorline = true
opt.fileencoding = 'utf-8'
opt.hidden = true
opt.pumheight = 10
opt.scrolloff = 3
opt.showmode = false
opt.sidescrolloff = 5
opt.signcolumn = 'yes'
opt.termguicolors = true -- enable 24-bit RGB colors
opt.timeoutlen = 100
opt.updatetime = 300
opt.whichwrap = 'b,s,<,>,[,],h,l'
opt.wrap = false
opt.writebackup = false
