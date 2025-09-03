local conf = require('telescope.config').values
local themes = require 'telescope.themes'

-- Abre la lista de Harpoon en Telescope (tema ivy)
local function toggle_telescope(hlist)
  local file_paths = {}
  for _, item in ipairs(hlist.items) do
    table.insert(file_paths, item.value)
  end

  local opts = themes.get_ivy {
    prompt_title = 'Working List',
  }

  require('telescope.pickers')
    .new(opts, {
      finder = require('telescope.finders').new_table { results = file_paths },
      previewer = conf.file_previewer(opts),
      sorter = conf.generic_sorter(opts),
    })
    :find()
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup() -- <- init v2

    -- Añadir archivo actual
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon: add file' })

    -- Menú rápido de harpoon
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon: quick menu' })

    -- Abrir con Telescope (lista grande + preview)
    vim.keymap.set('n', '<leader>fl', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Harpoon: Telescope list' })

    -- Navegación cíclica
    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon: prev' })
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon: next' })

    -- Saltos directos 1..4 (útil para flujo T3: page ↔ schema ↔ test, etc.)
    for i = 1, 4 do
      vim.keymap.set('n', ('<leader>%d'):format(i), function()
        harpoon:list():select(i)
      end, { desc = ('Harpoon: go to %d'):format(i) })
    end
  end,
}
