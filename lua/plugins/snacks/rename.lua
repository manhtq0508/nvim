return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    rename = {},
  },

  keys = {
    {
      "<leader>lR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename file (LSP)",
    },
  },
}
