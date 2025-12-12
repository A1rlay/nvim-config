return {
  'nvim-telescope/telescope.nvim',
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
      layout_strategy = 'horizontal',
      layout_config = {
        width = 0.99,
        height = 0.95,
        preview_width = 0.6,

        preview_height = 0.9,
      },
      winblend = 10,
    })
    return opts
  end,
}
