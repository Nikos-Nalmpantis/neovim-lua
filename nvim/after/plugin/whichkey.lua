local which_key_ok, which_key = pcall(require, "which-key")
if not which_key_ok then
  return
end

local mappings = {
  -- Single commands
  { "<leader>,",  "<cmd>NvimTreeFocus<cr>",                                              desc = "Explorer focus",             nowait = true, remap = false },
  { "<leader>B",  "<cmd>:!ruff format %<cr>",                                            desc = "Ruff format (Black)",        nowait = true, remap = false },
  { "<leader>F",  "<cmd>Telescope live_grep theme=ivy<cr>",                              desc = "Find Text",                  nowait = true, remap = false },
  { "<leader>P",  "<cmd>Telescope projects<cr>",                                         desc = "Projects",                   nowait = true, remap = false },
  { "<leader>S",  "<cmd>setlocal spell spelllang=en_us<cr>",                             desc = "Spellcheck",                 nowait = true, remap = false },
  { "<leader>a",  "<cmd>Alpha<cr>",                                                      desc = "Alpha",                      nowait = true, remap = false },
  { "<leader>b",  "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",           desc = "Buffers",                    nowait = true, remap = false },
  { "<leader>c",  "<cmd>Bdelete!<CR>",                                                   desc = "Close Buffer",               nowait = true, remap = false },
  { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                                             desc = "Explorer toggle",            nowait = true, remap = false },
  { "<leader>f",  "<cmd>Telescope find_files<cr>",                                       desc = "Find files",                 nowait = true, remap = false },
  { "<leader>h",  "<cmd>nohlsearch<CR>",                                                 desc = "No Highlight",               nowait = true, remap = false },
  { "<leader>r",  "<cmd>Telescope oldfiles<cr>",                                         desc = "Recent files",               nowait = true, remap = false },
  { "<leader>w",  "<cmd>w!<CR>",                                                         desc = "Save",                       nowait = true, remap = false },

  -- Groups
  { "<leader>G",  group = "Git",                                                         nowait = true,                       remap = false },
  { "<leader>GR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                      desc = "Reset Buffer",               nowait = true, remap = false },
  { "<leader>Gb", "<cmd>Telescope git_branches<cr>",                                     desc = "Checkout branch",            nowait = true, remap = false },
  { "<leader>Gc", "<cmd>Telescope git_commits<cr>",                                      desc = "Checkout commit",            nowait = true, remap = false },
  { "<leader>Gd", "<cmd>Gitsigns diffthis HEAD<cr>",                                     desc = "Diff",                       nowait = true, remap = false },
  { "<leader>Gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                                      desc = "Lazygit",                    nowait = true, remap = false },
  { "<leader>Gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",                         desc = "Next Hunk",                  nowait = true, remap = false },
  { "<leader>Gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",                         desc = "Prev Hunk",                  nowait = true, remap = false },
  { "<leader>Gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",                        desc = "Blame Line",                 nowait = true, remap = false },
  { "<leader>Go", "<cmd>Telescope git_status<cr>",                                       desc = "Open changed file",          nowait = true, remap = false },
  { "<leader>Gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                      desc = "Preview Hunk",               nowait = true, remap = false },
  { "<leader>Gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                        desc = "Reset Hunk",                 nowait = true, remap = false },
  { "<leader>Gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                        desc = "Stage Hunk",                 nowait = true, remap = false },
  { "<leader>Gt", "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<cr>",         desc = "Toggle current line blame",  nowait = true, remap = false },
  { "<leader>Gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                   desc = "Undo Stage Hunk",            nowait = true, remap = false },

  { "<leader>T",  group = "Typos",                                                       nowait = true,                       remap = false },
  { "<leader>Tc", "<cmd>:!typos %<cr>",                                                  desc = "Check for typos",            nowait = true, remap = false },
  { "<leader>Tf", "<cmd>:!typos -w %<cr>",                                               desc = "Fix typos",                  nowait = true, remap = false },

  { "<leader>g",  group = "goto-preview",                                                nowait = true,                       remap = false },
  { "<leader>gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",      desc = "Preview Definition",         nowait = true, remap = false },
  { "<leader>gi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",  desc = "Preview Implementation",     nowait = true, remap = false },
  { "<leader>gp", "<cmd>lua require('goto-preview').close_all_win()<CR>",                desc = "Close All Windows",          nowait = true, remap = false },
  { "<leader>gr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>",      desc = "Preview References",         nowait = true, remap = false },
  { "<leader>gt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "Preview Type Definition",    nowait = true, remap = false },

  { "<leader>l",  group = "LSP",                                                         nowait = true,                       remap = false },
  { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>",                                   desc = "Rename",                     nowait = true, remap = false },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                    desc = "Workspace Symbols",          nowait = true, remap = false },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                              desc = "Code Action",                nowait = true, remap = false },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>",                               desc = "Format",                     nowait = true, remap = false },
  { "<leader>li", "<cmd>LspInfo<cr>",                                                    desc = "Info",                       nowait = true, remap = false },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",                             desc = "Next Diagnostic",            nowait = true, remap = false },
  { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",                         desc = "Prev Diagnostic",            nowait = true, remap = false },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                                 desc = "CodeLens Action",            nowait = true, remap = false },
  { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",                       desc = "Quickfix",                   nowait = true, remap = false },
  { "<leader>lr", "<cmd>Telescope lsp_references<cr>",                                   desc = "References",                 nowait = true, remap = false },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",                             desc = "Document Symbols",           nowait = true, remap = false },

  { "<leader>n",  group = "Zen",                                                         nowait = true,                       remap = false },
  { "<leader>na", "<cmd>TZAtaraxis<cr>",                                                 desc = "Ataraxis",                   nowait = true, remap = false },
  { "<leader>nf", "<cmd>TZFocus<cr>",                                                    desc = "Focus",                      nowait = true, remap = false },
  { "<leader>nm", "<cmd>TZMinimalist<cr>",                                               desc = "Minimalist",                 nowait = true, remap = false },

  { "<leader>p",  group = "Packer",                                                      nowait = true,                       remap = false },
  { "<leader>pS", "<cmd>PackerStatus<cr>",                                               desc = "Status",                     nowait = true, remap = false },
  { "<leader>pc", "<cmd>PackerCompile<cr>",                                              desc = "Compile",                    nowait = true, remap = false },
  { "<leader>pi", "<cmd>PackerInstall<cr>",                                              desc = "Install",                    nowait = true, remap = false },
  { "<leader>ps", "<cmd>PackerSync<cr>",                                                 desc = "Sync",                       nowait = true, remap = false },
  { "<leader>pu", "<cmd>PackerUpdate<cr>",                                               desc = "Update",                     nowait = true, remap = false },

  { "<leader>q",  group = "Persistence",                                                 nowait = true,                       remap = false },
  { "<leader>qd", "<cmd>lua require('persistence').stop()<CR>",                          desc = "Don't Save Current Session", nowait = true, remap = false },
  { "<leader>ql", "<cmd>lua require('persistence').load({ last = true })<CR>",           desc = "Restore Last Session",       nowait = true, remap = false },
  { "<leader>qq", "<cmd>qa<CR>",                                                         desc = "Close Session",              nowait = true, remap = false },
  { "<leader>qs", "<cmd>lua require('persistence').load()<CR>",                          desc = "Restore Session",            nowait = true, remap = false },

  { "<leader>s",  group = "Search",                                                      nowait = true,                       remap = false },
  { "<leader>sC", "<cmd>Telescope commands<cr>",                                         desc = "Commands",                   nowait = true, remap = false },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>",                                        desc = "Man Pages",                  nowait = true, remap = false },
  { "<leader>sR", "<cmd>Telescope registers<cr>",                                        desc = "Registers",                  nowait = true, remap = false },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>",                                     desc = "Checkout branch",            nowait = true, remap = false },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>",                                      desc = "Colorscheme",                nowait = true, remap = false },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>",                                        desc = "Find Help",                  nowait = true, remap = false },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>",                                          desc = "Keymaps",                    nowait = true, remap = false },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>",                                         desc = "Open Recent File",           nowait = true, remap = false },

  { "<leader>t",  group = "Terminal",                                                    nowait = true,                       remap = false },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",                                 desc = "Float",                      nowait = true, remap = false },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>",                    desc = "Horizontal",                 nowait = true, remap = false },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>",                                         desc = "Node",                       nowait = true, remap = false },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>",                                       desc = "Python",                     nowait = true, remap = false },
  { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>",                                         desc = "Htop",                       nowait = true, remap = false },
  { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>",                                         desc = "NCDU",                       nowait = true, remap = false },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",                      desc = "Vertical",                   nowait = true, remap = false },
}

which_key.add(mappings)
