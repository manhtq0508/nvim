return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    toggle = {},
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.inlay_hints():map("<leader>uh")
    Snacks.toggle.indent():map("<leader>ug")
    Snacks.toggle.dim():map("<leader>uD")

    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.option("conceallevel", { off = 0, on = 2 }):map("<leader>uc")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
  end,
}
