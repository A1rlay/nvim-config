-- lua/custom/plugins/todo.lua
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false, -- seguimos sin signos en el gutter

      keywords = {
        TODO = { color = 'info' },
        FIX = { color = 'error' },
        NOTE = { color = 'hint' },
        DONE = { icon = '✔', color = 'test' }, -- nuevo DONE verde
      },

      colors = {
        error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
        warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
        info = { 'DiagnosticInfo', '#2563EB' },
        hint = { 'DiagnosticHint', '#10B981' },
        test = { 'DiagnosticOk', '#22c55e' }, -- verde para DONE
      },
    },
  },
}
