vim.g.neoformat_enabled_javascript = {'prettier'}
vim.g.neoformat_enabled_typescript = {'prettier'}

vim.cmd [[
augroup fmt
autocmd!
autocmd BufWritePre * undojoin | Neoformat
augroup END
]]
