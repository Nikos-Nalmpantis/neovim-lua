require("bufferline").setup{}
vim.cmd([[
nnoremap <leader><Tab> :BufferLineCycleNext<CR>
nnoremap <leader><S-Tab> :BufferLineCyclePrev<CR>
]])
