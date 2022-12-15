local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }

local termopts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set
local api_keymap = vim.api.nvim_set_keymap

keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap('n', 'K', vim.lsp.buf.hover, bufopts)
keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
keymap('n', 'gr', vim.lsp.buf.references, bufopts)
keymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

local on_attach =  function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 50,
}

lspconfig['rust_analyzer'].setup({
  on_attach = on_attach
})

lspconfig['tsserver'].setup({
  on_attach = on_attach,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

require('rust-tools').setup()

