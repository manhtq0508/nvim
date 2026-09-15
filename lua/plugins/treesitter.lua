return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter").install({
        "go",
        "c_sharp",
        "cpp",
        "c",
        "lua",
        "html",
        "query",
        "vim",
        "vimdoc",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "bash",
        "python",
        "markdown",
        "markdown_inline",
        "dockerfile",
        "yaml",
        "toml",
        "diff",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {},
  },
}
