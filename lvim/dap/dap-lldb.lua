local dap = require("dap")
local mason_path = vim.fn.glob(vim.fn.stdpath("data")) .. "/mason/"
local codelldb_exec_path = mason_path .. "packages/codelldb/codelldb"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_exec_path,
    args = { "--port", "${port}" },
  },
}

dap.configurations.cpp = {
  {
    -- launch
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      ---@diagnostic disable-next-line: redundant-parameter
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    -- launch with arguments
    name = "Launch with arguments",
    type = "codelldb",
    request = "launch",
    program = function()
      ---@diagnostic disable-next-line: redundant-parameter
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = function()
      local args_string = vim.fn.input('Arguments: ')
      return vim.split(args_string, " +")
    end,
  },
  {
    -- attach
    name = "Attach process",
    type = "codelldb",
    request = "attach",
    processId = require('dap.utils').pick_process,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    end,
    cwd = "${workspaceFolder}"
  },
}
dap.configurations.c = dap.configurations.cpp
