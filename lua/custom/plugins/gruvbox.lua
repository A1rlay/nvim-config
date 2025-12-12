return {
  lazy = true,
  enabled = true,
  'sainnhe/gruvbox-material',
  -- priority = 1000,
  config = function()
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    vim.g.gruvbox_material_diagnostic_text_highlight = 0
    vim.g.gruvbox_material_diagnostic_line_highlight = 0
    vim.g.gruvbox_material_inlay_hints_background = 'none'
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_ui_contrast = 'high'
    vim.g.gruvbox_material_foreground = 'material'
  end,
}
