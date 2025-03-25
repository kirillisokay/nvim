return {
  { 'nvim-treesitter/nvim-treesitter' },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'ruby',
        'html',
        'javascript',
        'css',
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  build = function()
    require('nvim-treesitter.install').update { with_sync = true }()
  end,
}
