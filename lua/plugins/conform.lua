return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      eruby = { "erb_format" },
      ruby = { "standardrb" },
      markdown = { "markdownlint" },
      yaml = { "yamlfix" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      json = { "jq" },
    },
  },
}
