local csharpier = require("plugins.formatting.formatter.csharpier")

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  init = csharpier.setup,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports" },
      cs = { "csharpier_server" },
      -- cs = { "csharpier" },
      cpp = { "clang_format" },
      c = { "clang_format" },
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      python = { "ruff_organize_imports", "ruff_format" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      sh = { "shfmt" },
      cmake = { "gersemi" },
      -- tex = { "latexindent" },
    },
    formatters = {
      csharpier_server = csharpier.formatter,
    },
    format_on_save = {
      timeout_ms = 5000,
      lsp_format = "fallback",
    },
  },
}
