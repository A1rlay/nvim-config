local opencode_cmd = 'opencode --port'

---@type snacks.terminal.Opts
local terminal_opts = {
  win = {
    position = 'right',
    enter = false,
  },
}

local function toggle()
  require('snacks.terminal').toggle(opencode_cmd, terminal_opts)
end

return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    -- snacks must load at startup so it can take over vim.ui.input / vim.ui.select
    {
      'folke/snacks.nvim',
      lazy = false,
      priority = 1000,
      ---@module 'snacks'
      ---@type snacks.Config
      opts = { input = {}, picker = {}, terminal = {} },
    },
  },
  keys = {
    {
      '<leader>oa',
      function()
        require('opencode').ask '@this: '
      end,
      mode = { 'n', 'x' },
      desc = '[O]pencode: [A]sk',
    },
    {
      '<leader>ox',
      function()
        require('opencode').select()
      end,
      mode = { 'n', 'x' },
      desc = '[O]pencode: e[X]ecute action',
    },
    -- Normal mode only: a <leader> mapping in terminal mode would delay every space typed in a terminal
    { '<leader>`', toggle, desc = 'Toggle opencode' },
    { '<M-`>', toggle, mode = { 'n', 't' }, desc = 'Toggle opencode' },
  },
  init = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require('snacks.terminal').open(opencode_cmd, terminal_opts)
        end,
      },
    }
  end,
}
