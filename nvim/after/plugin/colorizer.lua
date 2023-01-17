local ok, colorizer = pcall(require, "colorizer")
if not ok then
  return
end

colorizer.detach_from_buffer(0)
