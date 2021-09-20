-- require("rnvimr").setup{}
vim.cmd([[
tnoremap <leader>ri <C-\><C-n>:RnvimrResize<CR>
nnoremap <leader>r :RnvimrToggle<CR>
tnoremap <leader>r <C-\><C-n>:RnvimrToggle<CR>
]])

vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
