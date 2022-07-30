local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim" -- would automatically insatall packer if it is not there
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
-- My plugins here
use "wbthomason/packer.nvim" -- Have packer manage itself
use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

-- autopairs
use 'windwp/nvim-autopairs'

-- git integration
use 'lewis6991/gitsigns.nvim'
-- lazy git

-- colorsheme
--use { "ellisonleao/gruvbox.nvim" }
--use 'morhetz/gruvbox'
use 'Mofiqul/vscode.nvim'
--use 'monsonjeremy/onedark.nvim'
use 'olimorris/onedarkpro.nvim'

--use 'shaunsingh/nord.nvim'
use 'arcticicestudio/nord-vim'

-- statusline
use 'nvim-lualine/lualine.nvim'
---- tabs
use 'akinsho/bufferline.nvim'

-- terminal
use 'akinsho/toggleterm.nvim'

---- cmp plugins
use "hrsh7th/nvim-cmp" -- The completion plugin
use "hrsh7th/cmp-buffer" -- buffer completions
use "hrsh7th/cmp-path" -- path completions
use "hrsh7th/cmp-cmdline" -- cmdline completions
use "saadparwaiz1/cmp_luasnip" -- snippet completions
use "hrsh7th/cmp-nvim-lsp" --lsp

-- LSP
use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}

-- debuging
use 'mfussenegger/nvim-dap'

-- rust specific
use 'simrat39/rust-tools.nvim'
-- colorizer
use 'norcalli/nvim-colorizer.lua'

-- snippets
use "L3MON4D3/LuaSnip" --snippet engine
use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
use {   -- ruts crates
  'saecki/crates.nvim',
  event = { "BufRead Cargo.toml" },
  config = function()
      require('crates').setup()
  end,
}

-- markdown preview
use {'iamcco/markdown-preview.nvim', run = [[sh -c 'cd app && yarn install']]}

use 'nvim-treesitter/nvim-treesitter'
use 'p00f/nvim-ts-rainbow'


use 'kyazdani42/nvim-tree.lua'
use 'kyazdani42/nvim-web-devicons' -- optional, for file icon

---- Telescope
use 'nvim-telescope/telescope.nvim'

-- tags
use 'simrat39/symbols-outline.nvim'

-- dashboard
--use 'glepnir/dashboard-nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
