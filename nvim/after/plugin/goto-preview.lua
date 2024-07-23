local gotopreview_ok, gotopreview = pcall(require, "goto-preview")
if not gotopreview_ok then
	return
end

gotopreview.setup({
  default_mappings = true,
})


