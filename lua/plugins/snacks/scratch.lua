return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    scratch = {},
  },

  keys = {
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle scratch",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select scratch",
    },
  },
}
