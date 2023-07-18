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
  {
    -- launch
    name = "Launch current file",
    type = "codelldb",
    request = "launch",
    program = function()
      ---@diagnostic disable-next-line: redundant-parameter
      -- 获取当前文件路径
      local current_file_name = vim.fn.expand('%:t:r')
      local current_file_path = vim.fn.expand('%:p')
      local current_file_directory = vim.fn.fnamemodify(current_file_path, ':h')
      return vim.fn.input("Path to executable: ", current_file_directory .. "/build/" .. current_file_name, "file")
    end,
    cwd = "${workspaceFolder}",
    -- cwd = function()
    --   -- 获取当前文件路径
    --   local current_file_path = vim.fn.expand('%:p')
    --   local current_file_directory = vim.fn.fnamemodify(current_file_path, ':h')
    --   return current_file_directory
    -- end,
    stopOnEntry = false,
    args = {},
  },
  {
    -- launch
    name = "Launch current test",
    type = "codelldb",
    request = "launch",
    program = function()
      ---@diagnostic disable-next-line: redundant-parameter
      -- 获取当前文件路径
      local current_file_name = vim.fn.expand('%:t:r')
      local current_file_path = vim.fn.expand('%:p')
      local current_file_directory = vim.fn.fnamemodify(current_file_path, ':h')
      return vim.fn.input("Path to executable: ", current_file_directory .. "../build/" .. "test_" .. current_file_name,
        "file")
    end,
    cwd = "${workspaceFolder}",
    -- cwd = function()
    --   -- 获取当前文件路径
    --   local current_file_path = vim.fn.expand('%:p')
    --   local current_file_directory = vim.fn.fnamemodify(current_file_path, ':h')
    --   return current_file_directory
    -- end,
    stopOnEntry = false,
    args = {},
  },
}
dap.configurations.c = dap.configurations.cpp
