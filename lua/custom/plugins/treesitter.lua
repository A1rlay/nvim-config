return {
  'nvim-treesitter/nvim-treesitter',
  -- `master` is frozen upstream (development moved to `main`), but it is the
  -- branch that still supports this `configs` setup on Neovim 0.11
  branch = 'master',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSInstall', 'TSUpdate', 'TSInstallInfo' },
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'diff',
      'html',
      'javascript',
      'json',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
    },
    auto_install = true,
    highlight = {
      enable = true,
      -- Ruby's indent rules depend on vim's regex highlighting
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
}
