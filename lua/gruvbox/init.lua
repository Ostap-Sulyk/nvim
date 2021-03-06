local M = {}

-- default configs
M.config = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = true, -- will make italic comments and special strings
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard" or "soft"
  overrides = {},
}

function M.setup(config)
  M.config = vim.tbl_extend("force", M.config, config or {})
end

M.load = function()
  if vim.version().minor < 7 then
    vim.notify_once("gruvbox.nvim: you must use neovim 0.7 or higher")
    return
  end

  -- reset colors
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "gruvbox"
  vim.o.termguicolors = true

  local groups = require("gruvbox.groups").setup()

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  vim.cmd("colorscheme gruvbox")
end

return M
