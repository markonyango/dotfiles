vim.g.mapleader = " "
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.incsearch = true
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.g.have_nerd_font = true
vim.o.list = true
vim.opt.listchars:append { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10

vim.o.foldmethod = "indent"
vim.o.foldlevel = 4

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

local map = vim.keymap.set

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>e', ':Oil<CR>')
map('n', '<leader>f', function() require "conform".format { async = true, lsp_format = 'fallback' } end)
map('n', '<leader>sf', ':Pick files<CR>')
map('n', '<leader>sg', ':Pick grep<CR>')
map('n', '<leader>sh', ':Pick help<CR>')
map('n', '<leader>rn', vim.lsp.buf.rename)
map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action)
map({ 'n', 'x' }, '<leader>cd', vim.diagnostic.open_float)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.references)
map('n', '<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)

-- keymappings
vim.pack.add({
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-mini/mini.pick" },
  { src = "https://github.com/nvim-mini/mini.completion" },
  -- { src = "https://github.com/nvim-mini/mini.snippets" },
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/nvim-mini/mini.statusline" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/OXY2DEV/markview.nvim" },
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-flutter/flutter-tools.nvim" },
})


vim.lsp.config('*', {
  capabilities = vim.tbl_deep_extend('force',
    vim.lsp.protocol.make_client_capabilities(),
    {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = false
          }
        }
      }
    }
  )
})

vim.lsp.enable({ "lua_ls", "rust_analyzer", "svelte", "ts_ls", "angularls", "html", "tailwindcss" })

vim.cmd("colorscheme kanagawa")
vim.cmd(":hi statusline guibg=NONE")
vim.cmd("set completeopt+=noselect")

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)

  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require('mini.pick').setup({ window = { config = win_config } })
require('mini.completion').setup({
  window = {
    info = { border = "single", height = 120 },
    signature = { border = "single" }
  }
})
-- require('mini.snippets').setup()
require('mini.icons').setup({ style = 'glyph' })
require "mini.statusline".setup({ use_icons = true, })
require "fidget".setup({})
require "mason".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
  ensure_installed = { "bash", "c", "diff", "luadoc", "gitcommit", "svelte", "typescript", "javascript", "rust", "lua", "css", "html", "angular" },
  highlight = { enable = true },
  auto_install = true,
  sync_install = true,
  indent = { enable = true }
})
require "flutter-tools".setup({})

require "conform".setup({
  formatters_by_ft = {
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback"
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})


vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
