return {
  {
    'folke/which-key.nvim',
    opts = {},
    config = function(_, opts)
      require('which-key').setup(opts)
      require 'custom.ui_transparent'
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    opts = function(_, o)
      o.defaults = o.defaults or {}
      o.defaults.winblend = 10
      o.defaults.border = false
      return o
    end,
  },
}
