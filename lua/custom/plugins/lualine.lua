return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
      },
    }
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
  end,
}
