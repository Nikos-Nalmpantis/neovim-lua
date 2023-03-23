local ok, comment = pcall(require, "Comment")
if not ok then
  return
end

comment.setup {
  toggler = {
    line = "<leader>/",
    block = "<leader>?",
  },
  opleader = {
    line = "<leader>/",
    block = "<leader>?",
  },
}
