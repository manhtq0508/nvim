local M = {}

function M.setup()
  local dap = require("dap")
  local mason_path = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter"

  dap.adapters.bashdb = {
    type = "executable",
    command = mason_path .. "/bash-debug-adapter",
    name = "bashdb",
  }

  dap.configurations.sh = {
    {
      type = "bashdb",
      request = "launch",
      name = "Launch file",
      showDebugOutput = true,
      pathBashdb = mason_path .. "/extension/bashdb_dir/bashdb",
      pathBashdbLib = mason_path .. "/extension/bashdb_dir",
      trace = true,
      file = "${file}",
      program = "${file}",
      cwd = "${workspaceFolder}",
      pathCat = "cat",
      pathBash = "/bin/bash",
      pathMkfifo = "mkfifo",
      pathPkill = "pkill",
      args = {},
      env = {},
      terminalKind = "integrated",
    },
  }
end

return M
