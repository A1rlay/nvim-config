-- lua/custom/plugins/todo.lua
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,

      keywords = {
        TODO = { color = 'info' },
        FIX = { color = 'warning' },
        NOTE = { color = 'hint' },
        DONE = { icon = '✔', color = 'test' },
        WARNING = { color = 'error' },
      },

      colors = {
        error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
        warning = { 'DiagnosticWarn', 'WarningMsg', '#FF7518' },
        info = { 'DiagnosticInfo', '#2563EB' },
        hint = { 'DiagnosticHint', '#10B981' },
        test = { 'DiagnosticOk', '#22c55e' },
      },
    },
  },
}
