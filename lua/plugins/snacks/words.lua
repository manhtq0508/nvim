return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    words = {
      enabled = true,
    },
  },

  keys = {
    {
      "<leader>wj",
      function()
        Snacks.words.jump()
      end,
      desc = "Word jump",
    },
  },
}
