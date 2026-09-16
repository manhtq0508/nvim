return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    notifier = {
      enabled = true,
    },
  },

  keys = {
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show notification history",
    },
  },
}
