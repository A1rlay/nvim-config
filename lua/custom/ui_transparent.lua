vim.o.winblend = 10
vim.o.pumblend = 10

-- Monokai Pro greys (same palette as wezterm, vivid, p10k and the Claude theme)
local pro = {
  fg = '#fcfcfa',
  dimmed3 = '#727072',
  dimmed4 = '#5b595c',
  dimmed5 = '#403e41',
}

local transparent_groups = {
  -- windows
  'Normal',
  'NormalNC',
  'NormalFloat',
  'FloatBorder',
  'EndOfBuffer',
  'MsgArea',

  -- sign / fold / number columns
  'SignColumn',
  'SignColumnSB',
  'FoldColumn',
  'ColorColumn',
  'CursorColumn',

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

  -- Fidget
  'FidgetTitle',
  'FidgetTask',

  -- popup menu
  'Pmenu',
  'PmenuSbar',
  'PmenuThumb',
}

-- Groups that also lose their foreground
local invisible_groups = { 'WinSeparator', 'VertSplit', 'WinSeparatorNC', 'NeoTreeWinSeparator', 'StatusColumn' }

local function apply_transparency()
  local hl = vim.api.nvim_set_hl

  for _, group in ipairs(transparent_groups) do
    hl(0, group, vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = group, link = false }), { bg = 'none', ctermbg = 'none' }))
  end
  for _, group in ipairs(invisible_groups) do
    hl(0, group, { fg = 'none', bg = 'none', ctermfg = 'none', ctermbg = 'none' })
  end

  hl(0, 'LineNr', { fg = pro.dimmed3 })
  hl(0, 'LineNrAbove', { fg = pro.dimmed4 })
  hl(0, 'LineNrBelow', { fg = pro.dimmed4 })
  hl(0, 'CursorLineNr', { fg = pro.fg, bold = true })

  hl(0, 'PmenuSel', { bg = pro.dimmed5 })
  hl(0, 'CursorLine', { bg = pro.dimmed5 })
  hl(0, 'NeoTreeCursorLine', { bg = pro.dimmed5 })
end

local group = vim.api.nvim_create_augroup('custom-transparent-ui', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', { group = group, callback = apply_transparency })
-- Neo-tree defines its highlight groups when it opens, after the colorscheme
vim.api.nvim_create_autocmd('FileType', { group = group, pattern = 'neo-tree', callback = apply_transparency })
