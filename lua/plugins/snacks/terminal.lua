return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    terminal = {},
  },

  keys = {
    {
      "<leader>tf",
      function()
        Snacks.terminal(nil, {
          win = {
            position = "float",
            border = "rounded",
            width = 0.8,
            height = 0.8,
            title = " Terminal ",
            title_pos = "center",
            wo = {
              winbar = " Term #%{exists('b:snacks_terminal') ? b:snacks_terminal.id : 1} ",
            },
          },
        })
      end,
      desc = "Terminal (float)",
    },

    {
      "<leader>ts",
      function()
        Snacks.terminal(nil, {
          win = {
            position = "bottom",
            height = 0.35,
            title = " Terminal ",
            title_pos = "center",
            wo = {
              winbar = " Term #%{exists('b:snacks_terminal') ? b:snacks_terminal.id : 1} ",
            },
          },
        })
      end,
      desc = "Terminal (horizontal)",
    },

    {
      "<leader>tv",
      function()
        Snacks.terminal(nil, {
          win = {
            position = "right",
            width = 0.4,
            title = " Terminal ",
            title_pos = "center",
            wo = {
              winbar = " Term #%{exists('b:snacks_terminal') ? b:snacks_terminal.id : 1} ",
            },
          },
        })
      end,
      desc = "Terminal (vertical)",
    },
  },
}
