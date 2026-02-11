return {
  'anAcc22/sakura.nvim',
  dependencies = { 'rktjmp/lush.nvim' },
  lazy = false,
  priority = 1000,
  enabled = false,
  config = function()
    vim.opt.background = 'dark'
    -- vim.cmd.colorscheme 'sakura'
  end,
}
