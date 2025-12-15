return {
  'loctvl842/monokai-pro.nvim',
  name = 'monokai',
  config = function()
    require('monokai-pro').setup {
      terminal_colors = true,
      filter = 'pro',
      background_clear = {
        'float_win',
        'toggleterm',
        'telescope',
        'which-key',
        'renamer',
        'notify',
        'nvim-tree',
        'neo-tree',
        'bufferline',
        'statusline',
        'signcolumn',
        'line_nr',
        'end_of_buffer',
      },
    }

    local function clear_bg(group)
      pcall(vim.api.nvim_set_hl, 0, group, { bg = 'none', ctermbg = 'none' })
    end

    for _, g in ipairs {
      'SignColumn',
      'SignColumnSB',
      'LineNr',
      'CursorLineNr',
      'FoldColumn',
    } do
      clear_bg(g)
    end
  end,
}
