return {
  {
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
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
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
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    config = function()
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
      vim.g.gruvbox_material_diagnostic_text_highlight = 0
      vim.g.gruvbox_material_diagnostic_line_highlight = 0
      vim.g.gruvbox_material_inlay_hints_background = 'none'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_dim_inactive_windows = 0
      vim.g.gruvbox_material_foreground = 'material'
      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    opts = {
      theme = 'wave',
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)
      -- vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    enabled = false,
    config = function()
      require('nightfox').setup {
        options = {
          transparent = true,
          terminal_colors = true,
          dim_inactive = false,
        },
      }
      -- vim.cmd.colorscheme 'carbonfox'
    end,
  },
  {
    'anAcc22/sakura.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    enabled = false,
    config = function()
      vim.opt.background = 'dark'
      -- vim.cmd.colorscheme 'sakura'
    end,
  },
}
