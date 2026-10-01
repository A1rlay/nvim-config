-- Leader must be set before any plugin or keymap is loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'custom.options'
require 'custom.keymaps'
require 'custom.autocmds'
require 'custom.ui'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git', lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'custom.plugins' },
  require 'custom.themes',
}, {
  install = { colorscheme = { 'monokai-pro' } },
  change_detection = { notify = false },
  performance = {
    rtp = {
      -- Built-in plugins this config never uses
      disabled_plugins = { 'gzip', 'tarPlugin', 'tohtml', 'tutor', 'zipPlugin' },
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
