vim.o.winblend = 10
vim.o.pumblend = 10

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('MyTransparentUI', { clear = true }),
  callback = function()
    local hl = vim.api.nvim_set_hl

    local transparent_groups = {
      -- ventanas normales
      'Normal',
      'NormalNC',
      'NormalFloat',
      'SignColumn',
      'FoldColumn',
      'EndOfBuffer',
      'MsgArea',

      -- Neo-tree (sidebar)
      'NeoTreeNormal',
      'NeoTreeNormalNC',
      'NeoTreeFloatNormal',
      'NeoTreeEndOfBuffer',
      'NeoTreeStatusLine',
      'NeoTreeStatusLineNC',

      -- Telescope
      'TelescopeNormal',
      'TelescopeBorder',
      'TelescopePromptNormal',
      'TelescopePromptBorder',
      'TelescopeResultsNormal',
      'TelescopePreviewNormal',

      -- WhichKey
      'WhichKeyFloat',
      'WhichKeyNormal',
      'WhichKeyBorder',

      -- nvim-notify
      'NotifyBackground',
    }

    for _, group in ipairs(transparent_groups) do
      pcall(hl, 0, group, { bg = 'none' })
    end

    hl(0, 'CursorLine', { bg = '#33333b' })
    hl(0, 'NeoTreeCursorLine', { bg = '#33333b' })
  end,
})

vim.cmd 'doautocmd ColorScheme'
