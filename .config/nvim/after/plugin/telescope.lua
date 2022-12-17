local builtin = require('telescope.builtin')

-- require('telescope').setup {
--   defaults = {
-- 
--     prompt_prefix = " ",
--     selection_caret = " ",
--     path_display = { "smart" },
--     file_ignore_patterns = { ".git/", "node_modules" },
--   }
-- }

-- TELESCOPE
vim.keymap.set("n", "<leader>ff",":Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg",":Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fb",":Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fh",":Telescope help_tags<cr>", opts)
vim.keymap.set("n", "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end)
