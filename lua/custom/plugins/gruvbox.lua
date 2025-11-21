return {
  {
    'morhetz/gruvbox',
    name = 'gruvbox',
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or "light"
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_invert_selection = '0'
      vim.g.gruvbox_transparent_bg = 1
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
