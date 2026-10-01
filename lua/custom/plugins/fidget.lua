return {
  'j-hui/fidget.nvim',
  event = 'LspAttach',
  -- Transparent backgrounds are handled in custom/ui_transparent.lua
  opts = {
    notification = {
      window = {
        winblend = 0,
        normal_hl = 'NormalFloat',
        border = 'rounded',
        zindex = 45,
      },
    },
    progress = {
      suppress_on_insert = true,
    },
  },
}
