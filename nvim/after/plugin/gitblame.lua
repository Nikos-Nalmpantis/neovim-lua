local gitblame_ok, gitblame = pcall(require, "gitblame")
if not gitblame_ok then
  return
end

gitblame.disable()
