return {
  'loctvl842/monokai-pro.nvim',
  name = 'monokai',
  config = function()
    require('monokai-pro').setup {
      terminal_colors = true,
      filter = 'pro',
      transparent_background = true,
    }
    vim.cmd.colorscheme 'monokai-pro'
  end,
}
