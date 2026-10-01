-- Telescope is required inside the function, not at the top of the file:
-- lazy.nvim reads this file before any plugin is installed or loaded.
local function toggle_telescope(hlist)
  local conf = require('telescope.config').values
  local opts = require('telescope.themes').get_ivy { prompt_title = 'Working List' }

  local file_paths = {}
  for _, item in ipairs(hlist.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new(opts, {
      finder = require('telescope.finders').new_table { results = file_paths },
      previewer = conf.file_previewer(opts),
      sorter = conf.generic_sorter(opts),
    })
    :find()
end

local function list()
  return require('harpoon'):list()
end

local keys = {
  {
    '<leader>a',
    function()
      list():add()
    end,
    desc = 'Harpoon: add file',
  },
  {
    '<C-e>',
    function()
      require('harpoon').ui:toggle_quick_menu(list())
    end,
    desc = 'Harpoon: quick menu',
  },
  {
    '<leader>sl',
    function()
      toggle_telescope(list())
    end,
    desc = '[S]earch Harpoon [L]ist',
  },
  {
    '<C-p>',
    function()
      list():prev()
    end,
    desc = 'Harpoon: prev',
  },
  {
    '<C-n>',
    function()
      list():next()
    end,
    desc = 'Harpoon: next',
  },
}
for i = 1, 4 do
  table.insert(keys, {
    '<leader>' .. i,
    function()
      list():select(i)
    end,
    desc = 'Harpoon: go to ' .. i,
  })
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = keys,
  config = function()
    require('harpoon'):setup()
  end,
}
