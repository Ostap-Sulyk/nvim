local colorscheme = "gruvbox"


vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_italics = false
vim.g.vscode_style = "dark"
--vim.g.nord_disable_background = true

vim.g.vscode_style = "dark"
vim.g.gruvbox_contrast_dark = "medium"
vim.g.gruvbox_sign_column = "bg0"
vim.g.gruvbox_italic = 0
vim.g.gruvbox_bold = 0
vim.g.gruvbox_color_column = "bg0"
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_improved_warnings = 1
vim.g.gruvbox_transparent_bg=true


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
