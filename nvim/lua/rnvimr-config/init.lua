-- require("rnvimr").setup{}
vim.cmd([[
tnoremap <leader>bi <C-\><C-n>:RnvimrResize<CR>
nnoremap <leader>b :RnvimrToggle<CR>
tnoremap <leader>b <C-\><C-n>:RnvimrToggle<CR>
]])

vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
