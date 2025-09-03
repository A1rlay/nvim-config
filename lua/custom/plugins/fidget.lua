return {
  'j-hui/fidget.nvim',
  opts = {
    notification = {
      window = {
        winblend = 0, -- controla transparencia (0 = sólido, 100 = invisible)
        normal_hl = 'NormalFloat',
        border = 'rounded', -- si no quieres bordes: "none"
        zindex = 45,
      },
    },
    progress = {
      suppress_on_insert = true,
    },
  },
  config = function(_, opts)
    require('fidget').setup(opts)

    -- fuerza a que use transparencia total
    local hl = vim.api.nvim_set_hl
    hl(0, 'FidgetTitle', { bg = 'none' })
    hl(0, 'FidgetTask', { bg = 'none' })
    hl(0, 'NormalFloat', { bg = 'none' })
    hl(0, 'FloatBorder', { bg = 'none' })
  end,
}
