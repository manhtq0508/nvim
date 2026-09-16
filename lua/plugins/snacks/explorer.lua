return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {},
  },

  keys = {
    {
      "<leader>E",
      function()
        Snacks.explorer.reveal()
      end,
      desc = "Open Snacks explorer",
    },
  },
}
