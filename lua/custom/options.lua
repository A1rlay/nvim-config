-- See `:help option-list`

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false -- shown by lualine

-- Sync with the OS clipboard; scheduled because it can slow down startup
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.o.guicursor = 'n-v-c:block'

-- Indentation defaults; guess-indent overrides these per file
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.undofile = true

-- Case-insensitive search unless the pattern has a capital letter or \C
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split' -- live preview of :s
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true -- ask to save instead of failing on :q with unsaved changes

-- Reload files changed outside Neovim (e.g. edited by opencode)
vim.o.autoread = true
