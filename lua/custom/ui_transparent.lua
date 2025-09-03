-- ~/.config/nvim/lua/custom/ui_transparent.lua
vim.o.winblend = 10
vim.o.pumblend = 10

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('MyTransparentUI', { clear = true }),
  callback = function()
    local hl = vim.api.nvim_set_hl
    hl(0, 'Normal', { bg = 'none' })
    hl(0, 'NormalFloat', { bg = 'none' })
    hl(0, 'FloatBorder', { bg = 'none' })
    hl(0, 'MsgArea', { bg = 'none' })

    -- Telescope
    hl(0, 'TelescopeNormal', { bg = 'none' })
    hl(0, 'TelescopeBorder', { bg = 'none' })
    hl(0, 'TelescopePromptNormal', { bg = 'none' })
    hl(0, 'TelescopePromptBorder', { bg = 'none' })
    hl(0, 'TelescopeResultsNormal', { bg = 'none' })
    hl(0, 'TelescopePreviewNormal', { bg = 'none' })

    -- WhichKey
    hl(0, 'WhichKeyFloat', { bg = 'none' })
    hl(0, 'WhichKeyNormal', { bg = 'none' })
    hl(0, 'WhichKeyBorder', { bg = 'none' })

    -- nvim-notify
    hl(0, 'NotifyBackground', { bg = 'none' })
  end,
})

vim.cmd 'doautocmd ColorScheme'
