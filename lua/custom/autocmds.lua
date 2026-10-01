vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('custom-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  desc = 'Disable automatic text wrapping for C/C++',
  group = vim.api.nvim_create_augroup('custom-c-nowrap', { clear = true }),
  callback = function()
    vim.opt_local.textwidth = 0
    vim.opt_local.wrap = false
    vim.opt_local.linebreak = false
    vim.opt_local.formatoptions:remove { 't', 'c', 'r', 'o' }
  end,
})
