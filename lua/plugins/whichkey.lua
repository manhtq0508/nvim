return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>a", group = "AI", icon = { icon = "󰚩", color = "blue" } },
      { "<leader>d", group = "Debug" },
      { "<leader>g", group = "Git" },
      { "<leader>n", group = "Notification", icon = { icon = "󰎟", hl = "DiagnosticWarn" } },
      { "<leader>b", group = "Buffer" },
      { "<leader>f", group = "Picker (Snacks)", icon = { icon = "", color = "green" } },
      { "<leader>F", group = "Picker (FzfLua)", icon = { icon = "", color = "red" } },
      { "<leader>s", group = "Scope", icon = { icon = "󰘦", color = "yellow" } },
      { "<leader>t", group = "Terminal" },
      { "<leader>w", group = "Word", icon = { icon = "", color = "cyan" } },
      { "<leader>x", group = "Diagnostic" },
      { "<leader>u", group = "UI Toggle" },
      { "<leader>.", group = "Scratch", icon = { icon = "󰢵", color = "magenta" } },

      { "<leader>l", group = "LSP", icon = { icon = "󱐋", color = "brown" } },
      { "gra", desc = "Code Action" },
      { "grn", desc = "Rename" },
      { "grr", desc = "References" },
      { "gri", desc = "Go to Implementation" },
      { "grt", desc = "Type Definition" },
      { "grx", desc = "Run CodeLens" },
      { "gO", desc = "Document Symbols" },

      { "<localleader>d", icon = { icon = "", color = "red" } },
      { "<localleader>s", icon = { icon = "", color = "green" } },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
