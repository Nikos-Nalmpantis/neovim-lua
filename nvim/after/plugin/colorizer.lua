local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer_ok then
  return
end

colorizer.detach_from_buffer(0)
