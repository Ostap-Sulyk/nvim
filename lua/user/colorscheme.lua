local colorscheme = "codedark"


vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_italics = false
vim.g.vscode_style = "dark"
--vim.g.nord_disable_background = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
