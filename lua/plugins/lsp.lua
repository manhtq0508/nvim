return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
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
                        "basedpyright",
                        "ruff",

                        -- Formatters / Linters
                        "stylua",
                        "golangci-lint",
                        "goimports",
                        "csharpier",
                        "clang-format",
                        "prettier",
                    },
                },
            },
        },
        config = function(_, opts)
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰌵 ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
                virtual_text = true,
                underline = true,
                update_in_insert = false,
            })

            vim.lsp.config("*", {
                capabilities = vim.tbl_deep_extend(
                    "force",
                    require("blink.cmp").get_lsp_capabilities(),
                    { general = { positionEncodings = { "utf-16" } } }
                ),
            })

            require("mason-lspconfig").setup(opts)
        end,
    },
}
