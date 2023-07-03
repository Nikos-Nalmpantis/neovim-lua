local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

local ok2, lspconfig = pcall(require, "lspconfig")
if not ok2 then
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  -- "pylsp",
  -- "ruff_lsp",
  "pyright"
})

lsp.set_preferences {
  -- These are the defaults
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
}

lsp.on_attach(function(client, bufnr)
  local file_name = vim.fn.expand("%:t")
  local tfile_name = {}

  for str in string.gmatch(file_name, "[^.]+") do
    table.insert(tfile_name, str)
  end

  if tfile_name[2] == "blade" then
    vim.cmd("TSBufDisable highilight")
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopt = { noremap = true, silent = true, buffer = bufnr }
  local bind = vim.keymap.set

  bind("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>", bufopt)
  bind("n", "K", "<cmd>Lspsaga hover_doc<cr>", bufopt)
  bind("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", bufopt)
  bind("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, bufopt)
  bind("n", "<leader>dl", "<cmd>Lspasaga diagnostic_jump_next<cr>", bufopt)
  bind("n", "<leader>dh", "<cmd>Lspasaga diagnostic_jump_prev<cr>", bufopt)
end)

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<CR>"] = cmp.mapping.confirm({select=false}),
  ["<C-Space>"] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp {
  mapping = cmp_mappings
}

lsp.nvim_workspace()

-- lspconfig.pylsp.setup {
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {
--             "E402", -- Module level import not at top of the file
--             "F541", -- f-string is missing placeholders
--             "W391", -- Blank line at the end of file
--             "W503", -- Line break occurred before a binary operator
--           },
--           maxLineLength = 120
--         }
--       }
--     }
--   }
-- }
--
-- lspconfig.ruff_lsp.setup {
--   init_options = {
--     settings = {
--       args = {
--         line_length = 120
--       }
--     }
--   }
-- }

lspconfig.pyright.setup {
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off'
      }
    }
  }
}

lsp.setup()

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
}
