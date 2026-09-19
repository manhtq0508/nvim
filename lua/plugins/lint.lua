return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost" },
  config = function()
    local lint = require("lint")

    local chktex = lint.linters.chktex
    if type(chktex) == "function" then
      chktex = chktex()
    end
    lint.linters.chktex = vim.tbl_deep_extend("force", chktex, {
      ignore_exitcode = true,
    })

    lint.linters_by_ft = {
      go = { "golangcilint" },
      dockerfile = { "hadolint" },
      markdown = { "markdownlint-cli2" },
      sh = { "shellcheck" },
      cmake = { "cmakelint" },
      tex = { "chktex" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      desc = "Trigger linting on save",
      callback = function()
        if vim.bo.buftype == "" and vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })
  end,
}
