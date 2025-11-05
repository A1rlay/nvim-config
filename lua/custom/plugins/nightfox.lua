return {
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    priority = 1000,
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
      vim.cmd 'colorscheme nightfox' -- alternatives: dawnfox, duskfox, nordfox, terafox, carbonfox
    end,
  },
}
