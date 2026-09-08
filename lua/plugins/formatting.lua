return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "goimports" },
            cs = { "csharpier" },
            cpp = { "clang_format" },
            c = { "clang_format" },
            html = { "prettier" },
            css = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            python = { "ruff_organize_imports", "ruff_format" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
