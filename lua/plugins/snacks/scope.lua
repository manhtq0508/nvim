return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    scope = {
      enabled = true,
    },
  },

  keys = {
    {
      "<leader>st",
      function()
        Snacks.scope.textobject()
      end,
      desc = "Textobject mode (scope)",
    },
    {
      "<leader>sj",
      function()
        Snacks.scope.jump()
      end,
      desc = "Jump mode (scope)",
    },
  },
}
