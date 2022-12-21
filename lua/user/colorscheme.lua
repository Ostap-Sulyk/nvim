local colorscheme = "nord"

vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_italics = false
vim.g.vscode_style = "dark"
vim.g.vscode_transparent = false
vim.g.vscode_disable_nvimtree_bg = true
vim.g.vscode_style = "dark"

vim.g.tokyonight_style = "storm"

--vim.g.nord_disable_background = true

vim.g.gruvbox_contrast_dark = "medium"
vim.g.gruvbox_italic = 0
vim.g.gruvbox_bold = 0
--vim.g.gruvbox_improved_warnings = 1

if colorscheme == "onedark" then
  require('onedark').setup()
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
