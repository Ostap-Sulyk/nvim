vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  callback = function()
    local luasnip = require "luasnip"
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})
