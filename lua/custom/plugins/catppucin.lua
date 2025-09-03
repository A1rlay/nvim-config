return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha',
      transparent_background = true, -- ¡importante!
      integrations = {
        telescope = { enabled = true },
        which_key = true,
        cmp = true,
        gitsigns = true,
        treesitter = true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
