local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup {
  char = '·', -- Basic Char
  context_char = '⍿', -- Char when inside indentantion
  show_current_context = true, -- Changes to context_char when indsiede indentantion
  show_current_context_start = false, -- Underscores show current context start
}
