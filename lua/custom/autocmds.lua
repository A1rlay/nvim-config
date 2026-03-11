-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  desc = 'Disable automatic text wrapping for C/C++',
  callback = function()
    vim.opt_local.textwidth = 0
    vim.opt_local.wrap = false
    vim.opt_local.linebreak = false
    vim.opt_local.formatoptions:remove { 't', 'c', 'r', 'o' }
  end,
})
