return {
  'loctvl842/monokai-pro.nvim',
  name = 'monokai',
  lazy = false,
  priority = 1000,
  enabled = true,
  config = function()
    require('monokai-pro').setup {
      terminal_colors = true,
      filter = 'pro',
      transparent_background = true,
    }
    vim.cmd.colorscheme 'monokai-pro'
  end,
}
