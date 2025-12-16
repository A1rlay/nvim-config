return {
  'anAcc22/sakura.nvim',
  dependencies = { 'rktjmp/lush.nvim' },
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = 'dark' -- or "light"
    -- vim.cmd.colorscheme 'sakura'
  end,
}
