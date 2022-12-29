local builtin = require('telescope.builtin')

require('telescope').setup {
   defaults = {

     prompt_prefix = " ",
     selection_caret = " ",
     path_display = { "truncate" },
     file_ignore_patterns = { ".git/", "node_modules", ".angular" },
   }
}

require('telescope').load_extension('fzf')

-- TELESCOPE
vim.keymap.set("n", "<leader>ff",":Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg",":Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fb",":Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fw",":Telescope grep_string<cr>", opts)
vim.keymap.set("n", "<leader>fh",":Telescope help_tags<cr>", opts)
vim.keymap.set("n", "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end)

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
