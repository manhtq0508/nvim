return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    rename = {},
  },

  keys = {
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename file (LSP)",
    },
  },
}
