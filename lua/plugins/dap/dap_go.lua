return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {},
  -- FIX: Dubplicate keybinds
  keys = {
    {
      "<leader>td",
      function()
        require("dap-go").debug_test()
      end,
      desc = "Debug Nearest Go Test",
      ft = "go",
    },
    {
      "<leader>tl",
      function()
        require("dap-go").debug_last_test()
      end,
      desc = "Debug Last Go Test",
      ft = "go",
    },
  },
}
