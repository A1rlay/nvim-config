return {
  {
    'folke/which-key.nvim',
    opts = {},
    config = function(_, opts)
      require('which-key').setup(opts)
    end,
  },
  {
    'nvim-lua/plenary.nvim',
    lazy = false,
    priority = 900,
    config = function()
      vim.opt.fillchars:append { eob = ' ' }
      require 'custom.ui_transparent'
    end,
  },
}
