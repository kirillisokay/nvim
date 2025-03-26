return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15 -- Height for horizontal splits
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4 -- Width for vertical splits (40% of window)
        end
      end,
      open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal (Ctrl+\)
      hide_numbers = true, -- Hide line numbers in the terminal
      shade_terminals = true, -- Slightly darken the terminal background
      shading_factor = 2, -- Amount of shading
      start_in_insert = true, -- Start in insert mode when opening the terminal
      insert_mappings = true, -- Allow the open_mapping to work in insert mode
      persist_size = true, -- Remember the size of the terminal
      direction = 'float', -- Default to a floating terminal
      close_on_exit = true, -- Close the terminal when the process exits
      shell = vim.o.shell, -- Use the default shell
      float_opts = {
        border = 'curved', -- Use a curved border for the floating window
        winblend = 0, -- Transparency (0 = opaque)
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }

    -- Custom terminal instances for Rails development
    local Terminal = require('toggleterm.terminal').Terminal

    -- Rails Server Terminal (horizontal split)
    local rails_server = Terminal:new {
      cmd = 'bin/dev',
      hidden = true, -- Don't show this terminal by default
      direction = 'horizontal',
      on_open = function(term)
        vim.cmd 'startinsert!'
      end,
      on_close = function(term)
        vim.cmd 'stopinsert!'
      end,
    }

    function _G.stop_rails_server()
      if rails_server:is_open() then
        rails_server:send '\03' -- Sends Ctrl+C to the terminal
      end
    end

    -- Rails Console Terminal (vertical split)
    local rails_console = Terminal:new {
      cmd = 'rails console',
      hidden = true,
      direction = 'vertical',
      on_open = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    -- RSpec Test Terminal (floating)
    local rspec = Terminal:new {
      cmd = 'rspec',
      hidden = true,
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      on_open = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    -- Function to toggle each terminal
    function _G.toggle_rails_server()
      rails_server:toggle()
      vim.cmd 'wincmd p'
    end

    function _G.toggle_rails_console()
      rails_console:toggle()
    end

    function _G.toggle_rspec()
      rspec:toggle()
    end

    -- Keybindings for each terminal
    vim.api.nvim_set_keymap('n', '<leader>rs', '<cmd>lua toggle_rails_server()<CR>', { noremap = true, silent = true, desc = 'Toggle Rails Server' })
    vim.api.nvim_set_keymap('n', '<leader>rc', '<cmd>lua toggle_rails_console()<CR>', { noremap = true, silent = true, desc = 'Toggle Rails Console' })
    vim.api.nvim_set_keymap('n', '<leader>rt', '<cmd>lua toggle_rspec()<CR>', { noremap = true, silent = true, desc = 'Toggle RSpec Tests' })
    vim.api.nvim_set_keymap('n', '<leader>rx', '<cmd>lua stop_rails_server()<CR>', { noremap = true, silent = true, desc = 'Stop Rails Server' })

    -- Optional: Keybinding to send a specific RSpec file to the test terminal
    vim.api.nvim_set_keymap('n', '<leader>rf', ":TermExec cmd='rspec %' go_back=0<CR>", { noremap = true, silent = true, desc = 'Run RSpec on Current File' })
  end,
}
