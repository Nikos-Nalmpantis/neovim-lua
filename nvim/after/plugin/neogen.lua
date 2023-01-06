local ok, neogen = pcall(require, "neogen")
if not ok then
  return
end

neogen.setup {
  enabled = true,
  languages = {
    python = {
      template = {
        annotation_convention = "google_docstrings"
      }
    },
  }
}
