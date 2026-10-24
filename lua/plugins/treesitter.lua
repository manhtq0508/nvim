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
        callback = function(args)
          if not vim.treesitter.highlighter.active[args.buf] then
            vim.treesitter.start()
          end
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

          local lang = vim.treesitter.language.get_lang(args.match) or args.match
          local ok, query = pcall(vim.treesitter.query.get, lang, "indents")

          if ok and query then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          else
            vim.bo[args.buf].indentexpr = ""
            if vim.tbl_contains({ "cs", "c", "cpp", "java", "javascript", "typescript" }, args.match) then
              vim.bo[args.buf].cindent = true
            end
          end
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
