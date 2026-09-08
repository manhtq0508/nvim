return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets", -- snippet engines here
    },
    opts = {
        snippet = { preset = "default" },
        keymap = { preset = "default" },
        cmdline = {
            enabled = true,
            completion = {
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ":"
                    end,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    },
                },
            },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
}
