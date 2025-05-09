return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  build = 'make',
  config = function()
    local secrets = require 'secrets'

    require('avante').setup {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = 'groq',
      vendors = {
        groq = {
          __inherited_from = 'openai',
          api_key = secrets.GROQ_API_KEY,
          endpoint = 'https://api.groq.com/openai/v1/',
          model = 'whisper-large-v3',
          max_tokens = 8192,
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
