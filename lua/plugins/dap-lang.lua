return {
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local debugpyPath = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(debugpyPath)
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
        keys = {
            {
                "<leader>td",
                function()
                    require("dap-go").debug_test()
                end,
                desc = "Debug Nearest Go Test",
                ft = "go",
            },
            {
                "<leader>tl",
                function()
                    require("dap-go").debug_last_test()
                end,
                desc = "Debug Last Go Test",
                ft = "go",
            },
        },
    },
    {
        "nicholasmata/nvim-dap-cs",
        ft = "cs",
        dependencies = { "mfussenegger/nvim-dap", "mason-org/mason.nvim" },
        opts = {},
    },
    {
        "julianolf/nvim-dap-lldb",
        ft = { "c", "cpp", "rust" },
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
    },
}
