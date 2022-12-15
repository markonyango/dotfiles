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
  use "williamboman/mason.nvim"
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true }}

  -- LSP
  use 'simrat39/rust-tools.nvim'
  use 'neovim/nvim-lspconfig'

  -- Cmp 
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires= { { "nvim-lua/plenary.nvim" } } }

  -- Colorschemes
  use { "folke/tokyonight.nvim" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
