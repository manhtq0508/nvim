return {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = false,
      },
    },
  },
}
