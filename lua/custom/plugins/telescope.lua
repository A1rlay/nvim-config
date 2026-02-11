return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
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
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
      layout_strategy = 'horizontal',
      layout_config = {
        width = 0.95,
        height = 0.95,
        preview_width = 0.55,
      },
      winblend = 0,
      border = true,
    })
    return opts
  end,
  config = function(_, opts)
    require('telescope').setup(opts)

    pcall(require('telescope').load_extension, 'fzf')
    -- pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').current_buffer_fuzzy_find()
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    local function apply_telescope_transparency()
      local solid_bg = '#1f1d1a'
      local border_fg = '#e6db74'

      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = border_fg, bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = border_fg, bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = border_fg, bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = border_fg, bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })
    end

    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('TelescopeTransparency', { clear = true }),
      callback = apply_telescope_transparency,
    })

    apply_telescope_transparency()
  end,
}
