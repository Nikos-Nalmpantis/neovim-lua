local ok, indent_blankline = pcall(require, "ibl")
if not ok then
  return
end

indent_blankline.setup {
  indent = {
    char = '·', -- Basic Char
    tab_char = "⍿"
  },
  scope = {
    char = '⍿', -- Char when inside indentantion
    show_start = false,
    show_end = false,
  }
}
