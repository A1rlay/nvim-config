return {
  'nvim-telescope/telescope.nvim',
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
      layout_strategy = 'horizontal', -- otras opciones: vertical, flex, center
      layout_config = {
        -- para horizontal
        width = 0.99, -- porcentaje de la pantalla (1 = 100%)
        height = 0.95,
        preview_width = 0.6,

        -- para vertical
        preview_height = 0.9,
      },
      winblend = 10, -- mantiene transparencia
    })
    return opts
  end,
}
