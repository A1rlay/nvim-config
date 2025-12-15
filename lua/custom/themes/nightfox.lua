return {
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    config = function()
      require('nightfox').setup {
        options = {
          transparent = true,
          terminal_colors = true,
          dim_inactive = false,
        },
        palettes = {},
        specs = {},
        groups = {},
      }
      -- vim.cmd.colorscheme 'carbonfox' -- alternatives: nightfox, dawnfox, duskfox, nordfox, terafox, carbonfox
    end,
  },
}
