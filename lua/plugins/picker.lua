return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    file_icon_padding = "",
    defaults = {
      file_icons = "mini",
    },
  },
  ---@diagnostic enable: missing-fields
}
