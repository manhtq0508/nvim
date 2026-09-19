return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_latexmk_engines = {
      ["_"] = "-xelatex",
    }
    vim.g.vimtex_compiler_latexmk = { options = { "-xelatex", "-interaction=nonstopmode", "-synctex=1" } }
    vim.g.vimtex_view_method = "zathura"
  end,
}
