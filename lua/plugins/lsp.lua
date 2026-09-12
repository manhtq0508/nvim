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
                    registries = {
                        "github:mason-org/mason-registry",
                        "github:Crashdummyy/mason-registry",
                    },
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
                        "roslyn",
                        "clangd",
                        "html",
                        "cssls",
                        "ts_ls",
                        "eslint-lsp",
                        "emmet_ls",
                        "basedpyright",
                        "ruff",
                        "marksman",
                        "dockerls",
                        "docker_compose_language_service",
                        "taplo",
                        "yamlls",
                        "bashls",
                        "jsonls",
                        "rust-analyzer",

                        -- Formatters / Linters
                        "stylua",
                        "golangci-lint",
                        "goimports",
                        "csharpier",
                        "clang-format",
                        "prettier",
                        "markdownlint-cli2",
                        "hadolint",
                        "shellcheck",
                        "shfmt",
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
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        ---@module 'roslyn.config'
        ---@type RoslynNvimConfig
        opts = {
            -- your configuration comes here; leave empty for default settings
        },
    },
}
