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
  {
    'nvim-telescope/telescope.nvim',
    opts = function(_, opts)
      opts.defaults = opts.defaults or {}
      opts.defaults.winblend = 10
      opts.defaults.border = false
      return opts
    end,
  },
}
