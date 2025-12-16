return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup {
      on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'gd', function()
          vim.cmd 'vsplit'
          vim.lsp.buf.definition()
        end, vim.tbl_extend('force', opts, { desc = 'Go to definition (vertical split)' }))

        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'Show diagnostics for current line' }))

        vim.keymap.set('n', 'gL', function()
          vim.diagnostic.setqflist()
          vim.cmd 'copen'
        end, vim.tbl_extend('force', opts, { desc = 'Show all diagnostics (quickfix list)' }))
      end,
    }
  end,
}
