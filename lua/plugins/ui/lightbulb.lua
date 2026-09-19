return {
  "kosayoda/nvim-lightbulb",
  event = "LspAttach",
  opts = {
    autocmd = { enabled = true },
    sign = {
      enabled = true,
      text = "󱠀",
      hl = "LightBulbSign",
    },
    virtual_text = {
      enabled = false,
      text = "󱠀",
    },
  },
}
