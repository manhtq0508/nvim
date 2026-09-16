return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    gitbrowse = {},
    lazygit = {},
  },

  keys = {
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git blame (float & history)",
    },
    {
      "<leader>go",
      function()
        Snacks.gitbrowse.open()
      end,
      desc = "Git browse (open in browser)",
      mode = { "n", "v" },
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git status",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git diff (hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git log elseifile",
    },

    {
      "<leader>gg",
      function()
        Snacks.lazygit.open()
      end,
      desc = "Open lazygit",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Open file log (lazygit)",
    },
    {
      "<leader>gL",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Open log (lazygit)",
    },
  },
}
