return {
  -- NOTE: Catppuccin
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  --NOTE: Gruvbox

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {}

      vim.cmd 'colorscheme gruvbox'
    end,
  },

  --NOTE: Onedark

  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('onedarkpro').setup {
        -- colors = {
        --   purple: '#85788a'
        -- }
      }
    end,
  },
}
