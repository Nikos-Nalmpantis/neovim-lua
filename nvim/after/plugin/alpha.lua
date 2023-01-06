local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                                                          ]],
  [[                                                          ]],
  [[ █     █░ ██▓▒███████▒▒███████▒ ▄▄▄       ██▀███  ▓█████▄ ]],
  [[▓█░ █ ░█░▓██▒▒ ▒ ▒ ▄▀░▒ ▒ ▒ ▄▀░▒████▄    ▓██ ▒ ██▒▒██▀ ██▌]],
  [[▒█░ █ ░█ ▒██▒░ ▒ ▄▀▒░ ░ ▒ ▄▀▒░ ▒██  ▀█▄  ▓██ ░▄█ ▒░██   █▌]],
  [[░█░ █ ░█ ░██░  ▄▀▒   ░  ▄▀▒   ░░██▄▄▄▄██ ▒██▀▀█▄  ░▓█▄   ▌]],
  [[░░██▒██▓ ░██░▒███████▒▒███████▒ ▓█   ▓██▒░██▓ ▒██▒░▒████▓ ]],
  [[░ ▓░▒ ▒  ░▓  ░▒▒ ▓░▒░▒░▒▒ ▓░▒░▒ ▒▒   ▓▒█░░ ▒▓ ░▒▓░ ▒▒▓  ▒ ]],
  [[  ▒ ░ ░   ▒ ░░░▒ ▒ ░ ▒░░▒ ▒ ░ ▒  ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ▒  ▒ ]],
  [[  ░   ░   ▒ ░░ ░ ░ ░ ░░ ░ ░ ░ ░  ░   ▒     ░░   ░  ░ ░  ░ ]],
  [[    ░     ░    ░ ░      ░ ░          ░  ░   ░        ░    ]],
  [[             ░        ░                            ░      ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "🔍 Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "📄 New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "📁 Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "🕒 Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "🇹 Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "⚙️  Configuration", ":e ~/.config/nvim/lua/plugins.lua<CR>"),
  dashboard.button("s", "🦥 Lazy Sync", ":Lazy sync<CR>"),
	dashboard.button("q", "❌ Quit Neovim", ":qa<CR>"),
}

local function footer()
  local date= os.date "%d-%m-%Y"
  local time = os.date "%H:%M:%S"
  local plugins_text = "  🧙"
    .. "   v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
    .. "  📅 "
    .. date
    .. "  ⏲ "
    .. time
    .. "  🧙"

  -- Quote
  local fortune = require "alpha.fortune"
  local quote = table.concat(fortune(), "\n")

  local footer_text = plugins_text .. "\n" .. quote

  return footer_text
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
