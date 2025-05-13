vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

vim.opt.splitright = true
vim.opt.splitbelow = true

---------------------------
-- experimental settings --
---------------------------
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.diagnostic.config({ virtual_text = true })
