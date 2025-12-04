-- Terminal colors
return {
  {
    -- sólo para ejecutar nuestro código UI
    'folke/which-key.nvim',
    opts = {}, -- deja which-key activo
    config = function(_, opts)
      require('which-key').setup(opts)
      -- cargar tu código de transparencia
      require 'custom.ui_transparent'
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    opts = function(_, o)
      -- un poco de blending en Telescope
      o.defaults = o.defaults or {}
      o.defaults.winblend = 10
      o.defaults.border = false
      return o
    end,
  },
}
