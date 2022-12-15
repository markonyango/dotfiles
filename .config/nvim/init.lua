require('options')
require('keybindings')
require('plugins')
require('colorscheme')
require('telescope')
require('lsp_config')
require('cmp_config')
require('lualine_config')

require('mason').setup({
  PATH = "prepend",
  ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
