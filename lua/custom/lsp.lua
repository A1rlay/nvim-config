local M = {}

-- Defer loading Telescope until the keymap is actually used
local function telescope(picker, opts)
  return function()
    require('telescope.builtin')[picker](opts)
  end
end

local function on_attach(event)
  local map = function(keys, func, desc, mode)
    vim.keymap.set(mode or 'n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end

  map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
  map('grr', telescope 'lsp_references', '[G]oto [R]eferences')
  map('gri', telescope 'lsp_implementations', '[G]oto [I]mplementation')
  map('grd', telescope 'lsp_definitions', '[G]oto [D]efinition')
  map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('grt', telescope 'lsp_type_definitions', '[G]oto [T]ype Definition')
  map('gO', telescope 'lsp_document_symbols', 'Open Document Symbols')
  map('gW', telescope 'lsp_dynamic_workspace_symbols', 'Open Workspace Symbols')

  -- Opens the split only when there is exactly one definition; several open a picker, none just notifies
  map('gd', telescope('lsp_definitions', { jump_type = 'vsplit' }), 'Go to definition (vertical split)')
  map('gl', vim.diagnostic.open_float, 'Show diagnostics for current line')
  map('gL', function()
    vim.diagnostic.setqflist()
  end, 'Show all diagnostics (quickfix list)')

  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if not client then
    return
  end

  -- Highlight references of the word under the cursor while it rests there
  if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
    local highlight_augroup = vim.api.nvim_create_augroup('custom-lsp-highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })
    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('custom-lsp-detach', { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'custom-lsp-highlight', buffer = event2.buf }
      end,
    })
  end

  if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
    end, '[T]oggle Inlay [H]ints')
  end
end

-- Capabilities to advertise to every server, including typescript-tools
function M.capabilities()
  return require('blink.cmp').get_lsp_capabilities()
end

function M.setup()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
    callback = on_attach,
  })

  vim.diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = vim.g.have_nerd_font and {
      text = {
        [vim.diagnostic.severity.ERROR] = '󰅚 ',
        [vim.diagnostic.severity.WARN] = '󰀪 ',
        [vim.diagnostic.severity.INFO] = '󰋽 ',
        [vim.diagnostic.severity.HINT] = '󰌶 ',
      },
    } or {},
    virtual_text = { source = 'if_many', spacing = 2 },
  }

  -- Per-server overrides, deep-merged over nvim-lspconfig's defaults (see `:help lspconfig-all`)
  local servers = {
    clangd = {
      cmd = {
        'clangd',
        '--fallback-style={BasedOnStyle: LLVM, ColumnLimit: 0}',
      },
    },
    pyright = {},
    lua_ls = {
      settings = {
        Lua = {
          completion = { callSnippet = 'Replace' },
        },
      },
    },
  }

  local ensure_installed = vim.tbl_keys(servers)
  vim.list_extend(ensure_installed, {
    'clang-format',
    'stylua',
    'prettierd', -- conform tries it first for TS/JS; it uses the project's own prettier
    -- Installed only to provide `tsserver.js` for typescript-tools.nvim, which
    -- resolves it from `$MASON/packages/typescript-language-server/node_modules`.
    -- The `ts_ls` client itself stays disabled below (typescript-tools replaces it).
    'typescript-language-server',
  })
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  -- `vim.lsp.config(name, cfg)` deep-merges `cfg` over the defaults that
  -- nvim-lspconfig ships in its `lsp/<name>.lua` files, so we only specify what
  -- we want to change. This must run before anything calls `vim.lsp.enable()`.
  --
  -- NOTE: this replaces mason-lspconfig's `handlers` table, which was removed in
  -- v2 (we're on v2). Configs passed there were silently ignored -- no error, the
  -- overrides just never reached the servers.
  local capabilities = M.capabilities()
  for server_name, server in pairs(servers) do
    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
    vim.lsp.config(server_name, server)
  end

  require('mason-lspconfig').setup {
    ensure_installed = {}, -- installs are handled by mason-tool-installer above
    automatic_installation = false,
    -- v2 enables every mason-installed server via `vim.lsp.enable()`. Exclude
    -- `ts_ls`: typescript-tools.nvim already serves TS/JS buffers, and two
    -- clients on one buffer means duplicate diagnostics/completions.
    -- Exclude `stylua` too: mason's stylua is installed for conform, not as an LSP.
    automatic_enable = { exclude = { 'ts_ls', 'stylua' } },
  }
end

return M
