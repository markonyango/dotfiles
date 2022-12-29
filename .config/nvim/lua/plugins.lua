local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  print("Installing packer close and reopen Neovim afterwards...")
  vim.cmd([[packadd packer.nvim]])
end


-- Autcommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }

  -- LSP
  use 'simrat39/rust-tools.nvim'
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use { 'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP support
      { "williamboman/mason.nvim" },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },

      -- Cmp
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" }, -- buffer completions
      { "hrsh7th/cmp-path" }, -- path completions
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/nvim-cmp" }, -- The completion plugin
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" }
    }
  }

  use "kyazdani42/nvim-web-devicons"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup() end
  }

  -- Filetree
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { "nvim-lua/plenary.nvim" } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Colorschemes
  use "rebelot/kanagawa.nvim"

  use 'tpope/vim-fugitive'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
