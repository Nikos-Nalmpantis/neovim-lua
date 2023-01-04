local status_ok, gitblame = pcall(require, "gitblame")
if not status_ok then
  return
end

gitblame.disable()
