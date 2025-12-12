return {
  'j-hui/fidget.nvim',
  opts = {
    notification = {
      window = {
        winblend = 0,
        normal_hl = 'NormalFloat',
        border = 'rounded',
        zindex = 45,
      },
    },
    progress = {
      suppress_on_insert = true,
    },
  },
  config = function(_, opts)
    require('fidget').setup(opts)

    local hl = vim.api.nvim_set_hl
    hl(0, 'FidgetTitle', { bg = 'none' })
    hl(0, 'FidgetTask', { bg = 'none' })
    hl(0, 'NormalFloat', { bg = 'none' })
    hl(0, 'FloatBorder', { bg = 'none' })
  end,
}
