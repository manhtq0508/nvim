return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local parsers = {
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
        "cmake",
        "latex",
        "rust",
      }

      require("nvim-treesitter").install(parsers)

      local ft_set = {}
      for _, parser in ipairs(parsers) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(parser)) do
          ft_set[ft] = true
        end
      end
      ft_set["cs"] = true
      ft_set["help"] = true
      local ft_list = vim.tbl_keys(ft_set)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ft_list,
        callback = function()
          if not vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
            vim.treesitter.start()
          end
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPost",
    opts = {},
  },
}
