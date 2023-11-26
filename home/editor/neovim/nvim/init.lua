vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

require('lazyvim')

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.completeopt = 'menuone,noselect'
vim.o.clipboard = 'unnamedplus'
vim.o.scrolloff = 8
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 50
vim.o.colorcolumn = "80"
