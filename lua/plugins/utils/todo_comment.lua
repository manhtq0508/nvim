return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    {
      "<leader>ft",
      function()
        Snacks.picker.pick("todo_comments")
      end,
      desc = "Find todo",
    },
    {
      "<leader>fT",
      function()
        Snacks.picker.pick("todo_comments", { keywords = { "TODO", "FIX", "FIXME" } })
      end,
      desc = "Find urgent todo",
    },
  },
}
