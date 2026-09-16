return {
  "folke/snacks.nvim",

  keys = {
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete buffer (keep layout)",
    },
    {
      "<leader>bD",
      function()
        Snacks.bufdelete({ force = true })
      end,
      desc = "Force delete buffer (keep layout)",
    },
    {
      "<leader>bo",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Delete other buffers (keep layout)",
    },
    {
      "<leader>ba",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Delete all buffer (keep layout)",
    },
  },
}
