return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('onedarkpro').setup {
      -- colors = {
      --   purple: '#85788a'
      -- }
    }
    vim.cmd.colorscheme 'onedark_dark'
  end,
}
