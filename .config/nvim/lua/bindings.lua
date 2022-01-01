vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>ff",":Telescope find_files<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg",":Telescope live_grep<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb",":Telescope buffers<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh",":Telescope help_tags<cr>", { noremap = false, silent = true })
