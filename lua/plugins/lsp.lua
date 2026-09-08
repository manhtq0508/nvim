return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = { "stylua" },
            },
        },
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            "neovim/nvim-lspconfig",
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                opts = {
                    ensure_installed = {
                        -- LSP servers
                        "lua_ls",
                        "gopls",
                        "csharp_ls",
                        "clangd",
                        "html",
                        "cssls",
                        "ts_ls",
                        "emmet_ls",
                        -- Formatters
                        "stylua",
                        "goimports",
                        "csharpier",
                        "clang-format",
                        "prettier",
                    },
                },
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })
        end,
    },
}
