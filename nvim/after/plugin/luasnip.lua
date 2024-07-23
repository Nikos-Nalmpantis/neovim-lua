local from_vscode_ok, from_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not from_vscode_ok then
  return
end

from_vscode.lazy_load()
