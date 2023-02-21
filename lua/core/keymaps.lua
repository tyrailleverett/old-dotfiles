vim.g.mapleader = ' '
local km = vim.keymap

km.set('n', '<c-s>', ':w<cr>')
km.set('n', '<c-e>', ':q!<cr>')
