return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      automatic_enable = {
        exclude = { "stylua" },
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
          },
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
          ensure_installed = {
            -- LSP servers
            "lua_ls",
            "gopls",
            "roslyn",
            "clangd",
            "html",
            "cssls",
            "ts_ls",
            "eslint-lsp",
            "emmet_ls",
            "basedpyright",
            "ruff",
            "marksman",
            "dockerls",
            "docker_compose_language_service",
            "taplo",
            "yamlls",
            "bashls",
            "jsonls",
            "rust-analyzer",
            "neocmakelsp",
            "texlab",

            -- Formatters / Linters
            "stylua",
            "golangci-lint",
            "goimports",
            "csharpier",
            "clang-format",
            "prettier",
            "markdownlint-cli2",
            "hadolint",
            "shellcheck",
            "shfmt",
            "gersemi",
            "cmakelint",
          },
        },
      },
    },
    config = function(_, opts)
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        virtual_text = true,
        underline = true,
        update_in_insert = false,
      })

      vim.lsp.config("*", {
        capabilities = vim.tbl_deep_extend(
          "force",
          require("blink.cmp").get_lsp_capabilities(),
          { general = { positionEncodings = { "utf-16" } } }
        ),
      })

      require("mason-lspconfig").setup(opts)

      Snacks.keymap.set("n", "gd", function()
        Snacks.picker.lsp_definitions()
      end, {
        lsp = { method = "textDocument/definition" },
        desc = "Goto Definition",
      })
      Snacks.keymap.set("n", "gD", function()
        Snacks.picker.lsp_declarations()
      end, {
        lsp = { method = "textDocument/declaration" },
        desc = "Goto Declaration",
      })
      Snacks.keymap.set("n", "grr", function()
        Snacks.picker.lsp_references()
      end, {
        lsp = { method = "textDocument/references" },
        desc = "References",
      })
      Snacks.keymap.set("n", "gri", function()
        Snacks.picker.lsp_implementations()
      end, {
        lsp = { method = "textDocument/implementation" },
        desc = "Implementation",
      })
      Snacks.keymap.set("n", "grt", function()
        Snacks.picker.lsp_type_definitions()
      end, {
        lsp = { method = "textDocument/typeDefinition" },
        desc = "Type Definition",
      })
      Snacks.keymap.set("n", "gO", function()
        Snacks.picker.lsp_symbols()
      end, {
        lsp = { method = "textDocument/documentSymbol" },
        desc = "Document Symbols",
      })

      Snacks.keymap.set("n", "K", vim.lsp.buf.hover, {
        lsp = { method = "textDocument/hover" },
        desc = "Hover Documentation",
      })
      Snacks.keymap.set({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, {
        lsp = { method = "textDocument/codeAction" },
        desc = "Code Action",
      })
      Snacks.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {
        lsp = { method = "textDocument/rename" },
        desc = "Rename Symbol",
      })
      Snacks.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, {
        lsp = { method = "textDocument/formatting" },
        desc = "Format Document",
      })
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },
}
