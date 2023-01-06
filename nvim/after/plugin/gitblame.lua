local ok, gitblame = pcall(require, "gitblame")
if not ok then
  return
end

gitblame.disable()
