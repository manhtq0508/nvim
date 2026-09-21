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
      "<leader>nn",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show notification history",
    },
  },
}
