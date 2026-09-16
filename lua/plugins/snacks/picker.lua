return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {},
  },

  keys = {
    {
      "<leader>fF",
      function()
        Snacks.picker()
      end,
      desc = "Open picker",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find files (smart)",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find config file",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find buffers",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find words",
    },
    {
      "<leader>fW",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Find current words",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.lines()
      end,
      desc = "Find buffer lines",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Find command history",
    },

    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Find projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Find recent files",
    },

    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo history",
    },

    {
      "<leader>fd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Find diagnostics",
    },
    {
      "<leader>fD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Find buffer diagnostics",
    },
  },
}
