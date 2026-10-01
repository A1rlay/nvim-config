return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    -- Keymaps come from the shared LspAttach handler in custom/lsp.lua
    require('typescript-tools').setup {
      capabilities = require('custom.lsp').capabilities(),
    }
  end,
}
