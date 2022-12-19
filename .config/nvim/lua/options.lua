local options = {
  syntax = "on",
  wrap = false,
  expandtab = true,
  hidden = true,
  ignorecase = true,
  list = true,
  number = true,
  relativenumber = true,
  nu = true,
  scrolloff = 4,
  shiftwidth = 2,
  tabstop = 2,
  termguicolors = true,
  smartindent = true,
  cursorline = true,
  hlsearch = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
