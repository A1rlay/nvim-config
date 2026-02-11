vim.o.winblend = 10
vim.o.pumblend = 10

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('GlobalTransparentUI', { clear = true }),
  callback = function()
    local hl = vim.api.nvim_set_hl

    local transparent_groups = {
      -- ventanas normales
      'Normal',
      'NormalNC',
      'NormalFloat',
      'EndOfBuffer',
      'MsgArea',

      -- columnas de signos / folds / números
      'SignColumn',
      'SignColumnSB',
      'FoldColumn',
      'StatusColumn',
      'ColorColumn',
      'CursorColumn',

      -- números de línea
      'LineNr',
      'LineNrAbove',
      'LineNrBelow',
      'CursorLineNr',

      -- separadores de ventana / splits
      'WinSeparator',
      'VertSplit',
      'WinSeparatorNC',
      'NeoTreeWinSeparator',

      -- Neo-tree
      'NeoTreeNormal',
      'NeoTreeNormalNC',
      'NeoTreeFloatNormal',
      'NeoTreeEndOfBuffer',
      'NeoTreeStatusLine',
      'NeoTreeStatusLineNC',

      -- WhichKey
      'WhichKeyFloat',
      'WhichKeyNormal',
      'WhichKeyBorder',

      -- nvim-notify
      'NotifyBackground',

      -- Popups / menús
      'Pmenu',
      'PmenuSbar',
      'PmenuThumb',
    }

    for _, group in ipairs(transparent_groups) do
      pcall(hl, 0, group, {
        bg = 'none',
        fg = (group == 'WinSeparator' or group == 'VertSplit' or group == 'StatusColumn') and 'none' or nil,
        ctermbg = 'none',
        ctermfg = (group == 'WinSeparator' or group == 'VertSplit' or group == 'StatusColumn') and 'none' or nil,
      })
    end

    hl(0, 'LineNr', { fg = '#5e5e6e', bg = 'none' })
    hl(0, 'LineNrAbove', { fg = '#50505f', bg = 'none' })
    hl(0, 'LineNrBelow', { fg = '#50505f', bg = 'none' })
    hl(0, 'CursorLineNr', { fg = '#c8c8d0', bg = 'none', bold = true })

    hl(0, 'PmenuSel', { bg = '#33333b' })
    hl(0, 'CursorLine', { bg = '#33333b' })
    hl(0, 'NeoTreeCursorLine', { bg = '#33333b' })
  end,
})

vim.cmd 'doautocmd ColorScheme'
