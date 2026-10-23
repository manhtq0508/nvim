local M = {}

local bin = vim.fn.stdpath("data") .. "/mason/bin/csharpier"
local port = 18000 + (vim.fn.getpid() % 10000)
local server = nil

function M.start()
  if server then
    return
  end
  server = vim.system({ bin, "server", "--server-port", tostring(port) }, { text = true }, function()
    server = nil
  end)
end

function M.stop()
  if server then
    server:kill(15)
    server = nil
  end
end

function M.setup()
  local group = vim.api.nvim_create_augroup("CsharpierServer", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "cs",
    callback = M.start,
  })
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = group,
    callback = M.stop,
  })
end

M.formatter = {
  format = function(_, ctx, lines, callback)
    M.start()

    local body = vim.json.encode({
      fileContents = table.concat(lines, "\n"),
      fileName = ctx.filename,
    })

    local attempts = 0
    local function request()
      attempts = attempts + 1
      vim.system({
        "curl",
        "-s",
        "-f",
        "--max-time",
        "5",
        "-H",
        "Content-Type: application/json",
        "-d",
        "@-",
        "http://127.0.0.1:" .. port .. "/format",
      }, { stdin = body, text = true }, function(res)
        vim.schedule(function()
          if res.code == 7 and attempts < 15 then
            vim.defer_fn(request, 200)
            return
          end
          if res.code ~= 0 then
            callback("csharpier server error (curl code " .. res.code .. ")")
            return
          end

          local ok, data = pcall(vim.json.decode, res.stdout)
          if not ok then
            callback("csharpier server: invalid JSON response: " .. res.stdout)
            return
          end
          if data.formattedFile == nil or data.formattedFile == vim.NIL then
            callback(data.errorMessage ~= vim.NIL and data.errorMessage or nil)
            return
          end

          local out = data.formattedFile:gsub("\r\n", "\n"):gsub("\n$", "")
          callback(nil, vim.split(out, "\n", { plain = true }))
        end)
      end)
    end
    request()
  end,
}

return M
