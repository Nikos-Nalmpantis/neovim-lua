local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  "pylsp",
  "sumneko_lua",
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
  ["<C-Space>"] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp {
  mapping = cmp_mappings
}

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
}
