return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      lua = { 'stylua' },
      -- Without these, format_on_save falls through to lsp_format = 'fallback' and
      -- tsserver formats the buffer instead of prettier. They disagree (tsserver
      -- indents `...(cond ? { … } : {})` a level shallower), so saving a repo file
      -- silently produces a diff that CI's prettier check then rejects.
      -- conform resolves prettier from the project's node_modules, so .prettierrc applies.
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    },
    formatters = {
      clang_format = {
        prepend_args = { '--style={BasedOnStyle: LLVM, ColumnLimit: 0}' },
      },
    },
  },
}
