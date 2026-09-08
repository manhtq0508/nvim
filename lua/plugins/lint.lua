return {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            -- python = { "ruff" },
            -- javascript = { "eslint_d" },
            -- typescript = { "eslint_d" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            desc = "Using lint",
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
