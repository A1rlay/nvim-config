return {
  { -- Detect tabstop and shiftwidth automatically
    'NMAC427/guess-indent.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },

  { -- Git signs in the gutter
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Shows pending keybinds
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>o', group = '[O]pencode', mode = { 'n', 'x' } },
      },
    },
  },

  { -- Small independent modules
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      -- Around/inside textobjects: va), yinq, ci'
      require('mini.ai').setup { n_lines = 500 }
      -- Surroundings: saiw) add, sd' delete, sr)' replace
      require('mini.surround').setup()
    end,
  },
}
