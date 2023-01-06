local ok, gotopreview = pcall(require, "goto-preview")
if not ok then
	return
end

gotopreview.setup({
  default_mappings = true,
})


