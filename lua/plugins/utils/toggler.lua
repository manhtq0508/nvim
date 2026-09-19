return {
  "nat-418/boole.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    mappings = {
      increment = "<C-a>",
      decrement = "<C-x>",
    },
    additions = {
      { "true", "false" },
      { "True", "False" },
      { "yes", "no" },
      { "on", "off" },
      { "enable", "disable" },
      { "enabled", "disabled" },
      { "left", "right" },
      { "up", "down" },
    },
  },
}
