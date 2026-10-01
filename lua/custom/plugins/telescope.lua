local function builtin(picker, opts)
  return function()
    require('telescope.builtin')[picker](opts)
  end
end

local function set_preview_highlights()
  local ok, matching = pcall(vim.api.nvim_get_hl, 0, { name = 'TelescopeMatching', link = false })
  local preview_hl = vim.tbl_extend('force', ok and matching or { fg = '#fc9867', bold = true }, { nocombine = true, bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewLine', preview_hl)
  vim.api.nvim_set_hl(0, 'TelescopePreviewMatch', preview_hl)
end

return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    { '<leader>sh', builtin 'help_tags', desc = '[S]earch [H]elp' },
    { '<leader>sk', builtin 'keymaps', desc = '[S]earch [K]eymaps' },
    { '<leader>sf', builtin 'find_files', desc = '[S]earch [F]iles' },
    { '<leader>ss', builtin 'builtin', desc = '[S]earch [S]elect Telescope' },
    { '<leader>sw', builtin 'grep_string', desc = '[S]earch current [W]ord' },
    { '<leader>sg', builtin 'live_grep', desc = '[S]earch by [G]rep' },
    { '<leader>sd', builtin 'diagnostics', desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', builtin 'resume', desc = '[S]earch [R]esume' },
    { '<leader>s.', builtin 'oldfiles', desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', builtin 'buffers', desc = '[ ] Find existing buffers' },
    { '<leader>/', builtin 'current_buffer_fuzzy_find', desc = '[/] Fuzzily search in current buffer' },
    { '<leader>s/', builtin('live_grep', { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }), desc = '[S]earch [/] in Open Files' },
    {
      '<leader>sn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },
  },
  opts = {
    defaults = {
      layout_strategy = 'horizontal',
      layout_config = {
        width = 0.95,
        height = 0.95,
        preview_width = 0.55,
      },
      winblend = 0,
      border = true,
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    pcall(require('telescope').load_extension, 'fzf')

    set_preview_highlights()
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('custom-telescope-preview', { clear = true }),
      callback = set_preview_highlights,
    })
  end,
}
