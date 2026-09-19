return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    progress = {
      display = {
        render_limit = 16,
        done_ttl = 3,
      },
    },
    notification = {
      window = {
        winblend = 0,
      },
    },
  },
}
