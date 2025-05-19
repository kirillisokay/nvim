local secrets = require 'custom.plugins.secrets'
return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  build = 'make',
  config = function()
    require('avante').setup {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = 'deepseek',
      vendors = {
        deepseek = {
          api_key = secrets.DEEPSEEK_API_KEY, -- Make sure this is correct!
          endpoint = 'https://api.deepseek.com/v1', -- Try adding `/v1`
          model = 'deepseek-chat', -- Try "deepseek-chat" or "deepseek-coder"
          max_tokens = 4096, -- Lower if needed
        },
      },
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.pick', -- optional
    'nvim-telescope/telescope.nvim', -- optional
    'hrsh7th/nvim-cmp', -- optional
    'ibhagwan/fzf-lua', -- optional
    'nvim-tree/nvim-web-devicons', -- or mini.icons
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
