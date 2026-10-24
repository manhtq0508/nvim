return {
  "nvim-mini/mini.pairs",
  event = "InsertEnter",
  version = "*",
  opts = {},
  keys = {
    {
      "<CR>",
      function()
        return require("mini.pairs").cr()
      end,
      mode = "i",
      expr = true,
      replace_keycodes = false,
      desc = "Enter with pairs",
    },
  },
}
