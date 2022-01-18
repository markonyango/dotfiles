local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local call = vim.call
local Plug = vim.fn['plug#']

call('plug#begin', '~/.config/nvim/plugged')
Plug 'sbdchd/neoformat'

-- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'rmagatti/auto-session'

-- Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'


-- Color schemes
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'EdenEast/nightfox.nvim'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'rust-lang/rust.vim'

-- Markdown
Plug 'ellisonleao/glow.nvim'

-- Git
Plug 'kdheepak/lazygit.nvim'

-- Tabs
Plug 'alvarosevilla95/luatab.nvim'

-- Filetree
Plug 'kyazdani42/nvim-tree.lua'
call('plug#end')

require('completion')
require('luatab').setup{}
require('filetree')
