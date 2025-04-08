return {
  'weizheheng/ror.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'rcarriga/nvim-notify',
    'stevearc/dressing.nvim',
  },
  config = function()
    vim.notify = require 'notify'

    require('dressing').setup {
      input = {
        min_width = { 60, 0.9 },
      },
      select = {
        telescope = require('telescope.themes').get_dropdown {
          layout_config = {
            height = 15,
            width = 90,
          },
        },
      },
    }

    require('ror').setup {
      test = {
        message = {
          file = 'Running test file...',
          line = 'Running single test...',
        },
        coverage = {
          up = 'DiffAdd',
          down = 'DiffDelete',
        },
        notification = {
          timeout = false,
        },
        pass_icon = '✅',
        fail_icon = '❌',
      },
    }

    vim.keymap.set('n', '<Leader>rg', function()
      require('ror.commands').list_commands()
    end, { silent = true, desc = 'RoR Commands' })
  end,
}
