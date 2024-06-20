local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

local ok2, tabline = pcall(require, 'tabline')
if not ok2 then
  return
end

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg          = '#1F1F24',
  fg          = '#DCD7BA',
  yellow      = '#DCA561',
  cyan        = '#7AA89F',
  darkblue    = '#252535',
  green       = '#98BB6C',
  orange      = '#FFA066',
  violet      = '#957FB8',
  magenta     = '#D27E99',
  blue        = '#7E9CD8',
  red         = '#E46876',
  grey        = '#181825',
	black       = '#1e1e2e',
	white       = '#313244',
	light_green = '#6c7086',
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.blue, bg = colors.white },
		c = { fg = colors.white, bg = colors.black },
		z = { fg = colors.white, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.orange } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.white, fg = colors.blue },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.black, fg = colors.blue },
}

local filename = {
	'filename',
	color = { bg = colors.blue, fg = "#242735" },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = colors.white },
	separator = { left = "", right = "" },
}

local buffer = {
	tabline.tabline_buffers,
	separator = { left = "", right = "" },
}

local tabs = {
	tabline.tabline_tabs,
	separator = { left = "", right = "" },
}

local fileformat = {
	'fileformat',
	color = { bg = "#b4befe", fg = colors.white },
	separator = { left = "", right = "" },
}

local encoding = {
	'encoding',
	color = { bg = colors.white, fg = colors.blue },
	separator = { left = "", right = "" },
}

local branch = {
	'branch',
	color = { bg = "#a6e3a1", fg = colors.white },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = colors.white, fg = colors.white },
	separator = { left = "", right = "" },
}

local modes = {
	'mode', fmt = function(str) return str:sub(1, 1) end,
	color = { bg = "#fab387", fg = colors.black },
	separator = { left = "", right = "" },
}

local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
	local clients = vim.lsp.get_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	'diagnostics',
	color = { bg = colors.white, fg = colors.blue },
	separator = { left = "", right = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = "#f38ba8", fg = colors.black },
}

local location = {
	'location',
	color = { bg = colors.white, fg = colors.blue },
	separator = { left = "", right = "" },
}


lualine.setup {
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {
			--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			modes,
			vim_icons,
			--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = {
			space,
		},
		lualine_c = {
			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_x = {
			space,
		},
		lualine_y = {
			encoding,
			fileformat,
			space,
		},
		lualine_z = {
			dia,
			lsp,
      location,
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = {
			buffer,
		},
		lualine_b = {
		},
		lualine_c = {},
		lualine_x = {
			tabs,
		},
		lualine_y = {
			space,
		},
		lualine_z = {
		},
	},
	winbar = {},
	inactive_winbar = {},
}
