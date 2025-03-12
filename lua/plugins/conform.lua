return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      eruby = { "erb_format" },
      ruby = { "rubocop" },
      markdown = { "markdownlint" },
      yaml = { "yamlfix" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      json = { "jq" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    format_on_type = false,
  },
}
