--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
local home                             = os.getenv("HOME")
package.path                           = home .. "/.dotfiles/lvim/?.lua"

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
lvim.log.level                         = "warn"
-- lvim.format_on_save.enabled = false
lvim.format_on_save                    = {
  enabled = true,
  pattern = "*.lua,*.rs,*.go,*.proto",
  timeout = 1000,
}
lvim.colorscheme                       = "lunar"
-- themes: https://vimcolorschemes.com/
-- lvim.colorscheme                       = "bluloco-light"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

--  options
vim.opt.foldlevel                      = 99
vim.opt.foldmethod                     = "expr"
vim.opt.foldexpr                       = "nvim_treesitter#foldexpr()"
vim.opt.timeoutlen                     = 0
vim.opt.relativenumber                 = true
vim.opt.cursorcolumn                   = false
vim.opt.wrap                           = true
vim.opt.termguicolors                  = true
vim.g.transparent_background           = true
-- lvim.transparent_background            = true
-- lvim.transparent_window                = true

--lvim.g.neovide_transparency            = 0

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader                            = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"]         = ":w<cr>"
lvim.keys.normal_mode["E"]             = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["R"]             = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<tab>"]         = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-tab>"]       = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["H"]             = "^"
lvim.keys.normal_mode["L"]             = "$"
lvim.keys.normal_mode["Q"]             = "q"
lvim.keys.normal_mode["<leader>h"]     = ":nohl<cr>"
-- lvim.keys.normal_mode["<A-o>"] = ":ClangdSwitchSourceHeader<cr>"
lvim.keys.normal_mode["<leader>j"]     = ":ClangdSwitchSourceHeader<cr>"
lvim.keys.normal_mode["<leader>H"]     = ":ClangdTypeHierarchy<cr>"
lvim.keys.normal_mode["<leader>o"]     = ":Vista!!<cr>"
lvim.keys.normal_mode["<leader>q"]     = ":bd<cr>"
lvim.keys.normal_mode["q"]             = "<Nop>"
lvim.keys.normal_mode["n"]             = "nzzzv"
lvim.keys.normal_mode["N"]             = "Nzzzv"
lvim.keys.normal_mode["J"]             = "mzJ`z"

-- Translate
lvim.keys.normal_mode["T"]             = "<cmd>TranslateW<CR>"
lvim.keys.visual_mode["T"]             = "<cmd>TranslateW<CR>"
lvim.keys.visual_mode["<leader>T"]     = "<cmd>TranslateR<CR>"

lvim.keys.visual_mode["p"]             = "P"
lvim.keys.visual_mode["H"]             = "^"
lvim.keys.visual_mode["L"]             = "$"
lvim.keys.visual_mode["J"]             = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"]             = ":m '<-2<CR>gv=gv"

-- lsp
lvim.builtin.which_key.mappings["lc"]  = { ":lua vim.lsp.buf.incoming_calls()<cr>", "Incoming Calls" }
lvim.builtin.which_key.mappings["lo"]  = { ":lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing Calls" }
lvim.builtin.which_key.mappings.l.R    = { "<cmd>LspRestart<cr>", "Restart" }
lvim.builtin.which_key.vmappings["lf"] = { "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format" }
-- lvim.keys.normal_mode["<leader>ln"] = "<cmd>lua vim.lsp.buf.rename()<CR>"
-- lvim.keys.normal_mode["gh"] = ":lua vim.lsp.buf.hover()<cr>"
lvim.keys.normal_mode["gh"]            = ":Lspsaga lsp_finder<cr>"
lvim.keys.normal_mode["ga"]            = ":Lspsaga code_action<cr>"
lvim.keys.normal_mode["gi"]            = ":Lspsaga incoming_calls<cr>"
lvim.keys.normal_mode["go"]            = ":Lspsaga outgoing_calls<cr>"
lvim.keys.normal_mode["gd"]            = ":Lspsaga goto_definition<cr>"
lvim.keys.normal_mode["gp"]            = ":Lspsaga peek_definition<cr>"
lvim.keys.normal_mode["gt"]            = ":Lspsaga peek_type_definition<cr>"
lvim.keys.normal_mode["gn"]            = ":Lspsaga rename<cr>"
lvim.keys.normal_mode["glc"]           = ":Lspsaga show_cursor_diagnostics<cr>"
lvim.keys.normal_mode["gll"]           = ":Lspsaga show_line_diagnostics<cr>"
lvim.keys.normal_mode["glb"]           = ":Lspsaga show_buf_diagnostics<cr>"

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
lvim.keys.normal_mode["[e"]            = "<cmd>Lspsaga diagnostic_jump_prev<CR>"
lvim.keys.normal_mode["]e"]            = "<cmd>Lspsaga diagnostic_jump_next<CR>"

-- Diagnostic jump with filters such as only jumping to an error
-- lvim.keys.normal_mode["[E"]            =
-- "<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>"

-- lvim.keys.normal_mode["]E"]            =
-- "<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>"

-- telescope
lvim.keys.normal_mode["<leader>r"]     = ":Telescope oldfiles<cr>"

-- orverwirte old 's'
lvim.builtin.which_key.mappings.f      = nil
lvim.builtin.which_key.mappings.s      = nil
-- lvim.keys.normal_mode["<leader>s"]  = ":lua require('telescope.builtin').lsp_document_symbols()<cr>"
-- lvim.keys.normal_mode["<leader>S"]  = ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>"

lvim.builtin.which_key.mappings["s"]   = { ":lua require('telescope.builtin').lsp_document_symbols()<cr>",
  "Document Symbols" }
lvim.builtin.which_key.mappings["S"]   = { ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>",
  "Workspace Symbols" }

lvim.builtin.which_key.mappings["f"]   = {
  name = "File",
  f = { ":lua require('lvim.core.telescope.custom-finders').find_project_files()<cr>", "Find Project Files" },
  w = { ":lua require('my_funcs').live_grep_raw({default_text = vim.fn.expand('<cword>')})<cr>", "Find Word" },
  e = { ":lua require('my_funcs').live_grep_raw({default_text =''})<cr>", "Find" },
  d = {
    ":lua require('my_funcs').live_grep_raw({default_text =  '-g' .. vim.fn.fnamemodify(vim.fn.expand('%'), ':.:h') .. '/*' .. ' ' .. vim.fn.expand('<cword>')})<cr>",
    "Find In Dir" },
  -- r = {":Telescope oldfiles<cr>", "Find Old Files"},
  -- s = {":lua require('telescope.builtin').lsp_document_symbols()<cr>", "Document Symbols"},
  -- S  = {":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Workspace Symbols"}
}
-- lvim.keys.normal_mode["<leader>ff"] = ":lua require('lvim.core.telescope.custom-finders').find_project_files()<cr>"
-- lvim.keys.normal_mode["<leader>fe"] = ":lua require('my_funcs').live_grep_raw({default_text =''})<cr>"
lvim.builtin.which_key.vmappings["fw"] = { "<Esc>:lua require('my_funcs').live_grep_raw({}, 'v')<cr>",
  "Find Word In Project" }
-- lvim.keys.normal_mode["<leader>fw"] = ":lua require('my_funcs').live_grep_raw({default_text = vim.fn.expand('<cword>')})<cr>"
-- lvim.keys.normal_mode["<leader>fd"] = ":lua require('my_funcs').live_grep_raw({default_text =  '-g' .. vim.fn.fnamemodify(vim.fn.expand('%'), ':.:h') .. '/*' .. ' ' .. vim.fn.expand('<cword>')})<cr>"
lvim.keys.normal_mode["<leader>k"]     = "<cmd>Telescope keymaps<cr>"

-- hop
lvim.keys.normal_mode["f"]             =
"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
lvim.keys.normal_mode["F"]             =
"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
lvim.keys.normal_mode[";W"]            = "<cmd>HopWord<cr>"
lvim.keys.normal_mode[";w"]            = "<cmd>HopWordAC<cr>"
lvim.keys.normal_mode[";b"]            = "<cmd>HopWordBC<cr>"
lvim.keys.normal_mode[";c"]            = "<cmd>HopChar1AC<cr>"
lvim.keys.normal_mode[";C"]            = "<cmd>HopChar1<cr>"
lvim.keys.normal_mode[";l"]            = "<cmd>HopLine<cr>"
lvim.keys.normal_mode[";j"]            = "<cmd>HopLineAC<cr>"
lvim.keys.normal_mode[";k"]            = "<cmd>HopLineBC<cr>"
lvim.keys.normal_mode[";a"]            = "<cmd>HopAnywhere<cr>"
-- lvim.keys.normal_mode["<leader>k"] = "<cmd>HopChar2<cr>"


-- auto pairs
lvim.builtin.autopairs.disable_filetype = { "TelescopePrompt", "spectre_panel", "repl" }

-- dap
lvim.keys.normal_mode["<F12>"] = ":Telescope dap configurations<cr>"
lvim.builtin.which_key.mappings.d = {
  name = "Debug",
  h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
  t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
  d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
}

-- dap custom keymaps
lvim.keys.normal_mode["<F7>"] = "<cmd>lua require'dap'.step_into()<cr>"
lvim.keys.normal_mode["<C-F7>"] = "<cmd>lua require'dap'.step_out()<cr>"
lvim.keys.normal_mode["<F8>"] = "<cmd>lua require'dap'.step_over()<cr>"
lvim.keys.normal_mode["<F9>"] = "<cmd>lua require'dap'.run_to_cursor()<cr>"
lvim.keys.normal_mode["<F5>"] = "<cmd>lua require'dap'.continue()<cr>"
lvim.keys.normal_mode["<F6>"] = "<cmd>lua require'dap'.pause()<cr>"
-- lvim.keys.normal_mode["<S-F5>"] = "<cmd>lua require'dap'.terminate()<cr><cmd>lua require'dapui'.close()<cr>"
lvim.keys.normal_mode["<S-F5>"] = "<cmd>lua require'dap'.terminate()<cr>"
lvim.keys.normal_mode["<F2>"] = "<cmd>lua require'dap'.toggle_breakpoint()<cr>"
-- lvim.keys.normal_mode["<C-F12>"] = "<cmd>lua require'dapui'.toggle()<cr>"

-- unmap a default keymapping
-- vim.keymap.del("n", "q")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["T"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  t = { "<cmd>TodoTrouble<cr>", "Todo" }
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Toggle",
  a = { ":ASToggle<cr>", "Auto Save" },
  -- yank history
  y = { "<cmd>Telescope neoclip<cr>", "NeoClip" },
  t = { "<cmd>Telescope<cr>", "Telescope" },
  b = { "<cmd>Telescope marks<cr>", "Bookmarks" },
  C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  r = { "<cmd>Telescope registers<cr>", "Registers" },
  m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  c = { "<cmd>ChatGPT<cr>", "ChatGPT" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
-- nvim tree
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- dap
lvim.builtin.dap.active = true
-- cmp
lvim.builtin.cmp.cmdline.enable = true
table.insert(lvim.builtin.cmp.sources, {
  name = 'nvim_lsp_signature_help'
});
-- gitsigns
lvim.builtin.gitsigns.opts.current_line_blame = false
lvim.builtin.gitsigns.opts.current_line_blame_opts.virt_text_pos = "right_align"
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 200
-- buffer line
lvim.builtin.bufferline.highlights.buffer_selected = {
  bold = true,
  fg = "#ffd43b"
}


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "json",
  "lua",
  "python",
  "yaml",
  "markdown",
  "markdown_inline",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "clangd",
  "pyright",
}

-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }
-- local colors = {
--     blue   = '#80a0ff',
--     cyan   = '#79dac8',
--     black  = '#080808',
--     white  = '#c6c6c6',
--     red    = '#ff5189',
--     violet = '#d183e8',
--     grey   = '#303030',
-- }

-- lvim.builtin.lualine.options.theme = {
--     normal = {
--         c = { fg = colors.black, bg = colors.violet },
--         a = { fg = colors.white, bg = colors.grey },
--         b = { fg = colors.black, bg = colors.white },
--     },
--     insert = {
--         a = { fg = colors.black, bg = colors.blue },
--     },
--     visual = {
--         a = { fg = colors.black, bg = colors.cyan },
--     },
--     replace = {
--         a = { fg = colors.black, bg = colors.cyan },
--     },
--     inactive = {
--         a = { fg = colors.white, bg = colors.black },
--         b = { fg = colors.white, bg = colors.black },
--         c = { fg = colors.black, bg = colors.black },
--     },
-- }
-- lvim.builtin.lualine.options.component_separators = '|'
-- lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
-- lvim.builtin.lualine.sections = {
--     lualine_a = {
--         { 'mode', separator = { left = '' }, right_padding = 2 },
--     },
--     lualine_b = { 'filename', 'branch' },
--     lualine_c = { 'fileformat' },
--     lualine_x = {},
--     lualine_y = { 'filetype', 'progress' },
--     lualine_z = {
--         { 'location', separator = { right = '' }, left_padding = 2 },
--     },
-- }

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- disable diagnostics which is super annoying in my case
lvim.lsp.diagnostics.virtual_text = false
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
--
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "clangd" })
require("lvim.lsp.manager").setup("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
        autoImportCompletions = true
      }
    }
  },
})

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "pylsp"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- require "lsp_signature".on_attach()
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   -- { command = "flake8", filetypes = { "python" } },
--   -- {
--   --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--   --   command = "shellcheck",
--   --   ---@usage arguments to pass to the formatter
--   --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--   --   extra_args = { "--severity", "warning" },
--   -- },
--   {
--     command = "cpplint",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "c", "cpp" },
--   },

-- }
lvim.lsp.null_ls.setup.on_init = function(new_client, _)
  new_client.offset_encoding = "utf-16"
end


-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    -- better quick fix
    "kevinhwang91/nvim-bqf",
    config = function()
      require('bqf').setup(
        {
          func_map = {
            pscrollup = "<C-u>",
            pscrolldown = "<C-d>"
          },
        }
      )
    end
  },
  {
    -- only works on https://github.com/universal-ctags/ctags
    "liuchengxu/vista.vim",
    config = function()
      vim.cmd([[
      let g:vista_sidebar_position = 'vertical topleft'
      let g:vista_default_executive = 'nvim_lsp'
      ]])
    end
  },
  { -- telescope instant searching
    "nvim-telescope/telescope-live-grep-args.nvim"
  },
  -- {
  --   "ldelossa/litee.nvim",
  --   config = function()
  --     require("litee.lib").setup({})
  --   end
  -- },
  -- { -- calltree
  --   "ldelossa/litee-calltree.nvim",
  --   config = function()
  --     require("litee.calltree").setup({
  --       -- -- NOTE: the plugin is in-progressing
  --       -- on_open = "pannel", -- pannel | popout
  --       -- hide_cursor = false,
  --       -- keymaps = {
  --       --   expand = "o",
  --       --   collapse = "zc",
  --       --   collapse_all = "zM",
  --       --   jump = "<CR>",
  --       --   jump_split = "s",
  --       --   jump_vsplit = "v",
  --       --   jump_tab = "t",
  --       --   hover = "i",
  --       --   details = "d",
  --       --   close = "X",
  --       --   close_panel_pop_out = "<C-c>",
  --       --   help = "?",
  --       --   hide = "H",
  --       --   switch = "S",
  --       --   focus = "f"
  --       -- },
  --     })
  --   end
  -- },
  {
    "NLKNguyen/papercolor-theme"
  },
  {
    -- hop
    "phaazon/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { -- resize window
    "simeji/winresizer"
  },
  -- { -- vim clip on server
  --   "wincent/vim-clipper",
  --   config = function()
  --     vim.cmd([[
  --     let g:ClipperAddress="127.0.0.1"
  --     let g:ClipperPort=8377
  --     let g:ClipperAuto=1
  --     call clipper#set_invocation('netcat -c 127.0.0.1 8377')
  --   ]] )
  --   end
  -- },
  { -- log file content highlighting
    "mtdl9/vim-log-highlighting"
  },
  {
    "tpope/vim-surround"
  },
  { -- theme
    "morhetz/gruvbox"
  },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- your optional config goes here, see below.
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  -- { -- auto save
  --   "pocco81/auto-save.nvim"
  -- },
  {
    "p00f/clangd_extensions.nvim",
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      local provider = "clangd"
      local clangd_flags = {
        -- 在后台自动分析文件（基于complie_commands)
        "--compile-commands-dir=build",
        "--background-index",
        "--completion-style=detailed",
        -- 同时开启的任务数量
        "--all-scopes-completion=true",
        "--recovery-ast",
        "--suggest-missing-includes",
        -- 告诉clangd用那个clang进行编译，路径参考which clang++的路径
        "--query-driver=/usr/bin/clang++,/usr/bin/g++",
        "--clang-tidy",
        -- 全局补全（会自动补充头文件）
        "--all-scopes-completion",
        "--cross-file-rename",
        -- 更详细的补全内容
        "--completion-style=detailed",
        "--function-arg-placeholders=false",
        -- 补充头文件的形式
        "--header-insertion=never",
        -- pch优化的位置
        "--pch-storage=memory",
        "--offset-encoding=utf-16",
        "-j=12",
      }

      local custom_on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
      end


      local custom_on_init = function(client, bufnr)
        require("lvim.lsp").common_on_init(client, bufnr)
        require("clangd_extensions.config").setup {}
        require("clangd_extensions.ast").init()
        vim.cmd [[
              command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
              command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
              command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
              command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
              command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
              ]]
      end

      local opts = {
        cmd = { provider, unpack(clangd_flags) },
        on_attach = custom_on_attach,
        on_init = custom_on_init,
      }

      require("lvim.lsp.manager").setup("clangd", opts)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
                  ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
                  ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                  ['@parameter.outer'] = 'v', -- charwise
                  ['@function.outer'] = 'V',  -- linewise
                  ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true,
          },
          move = {
            enable = true,
            set_jumps = false, -- whether to set jumps in the jumplist
            goto_next_start = {
                  ["]]"] = "@function.outer",
              -- ["]["] = "@function.outer",
                  ["]o"] = "@loop.outer",
              -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            },
            goto_next_end = {
                  ["]["] = "@function.outer",
              -- ["]["] = "@class.outer",
            },
            goto_previous_start = {
                  ["[["] = "@function.outer",
              -- ["[]"] = "@function.outer",
            },
            goto_previous_end = {
                  ["[]"] = "@function.outer",
              -- ["[]"] = "@class.outer",
            },
            goto_next = {
                  ["]d"] = "@conditional.outer",
            },
            goto_previous = {
                  ["[d"] = "@conditional.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                  ["<leader>pf"] = "@function.outer",
                  ["<leader>pF"] = "@class.outer",
            },
          },
        },
      }
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup({
        keys = {
          telescope = {
            i = {
              select = '<cr>',
              paste = '<c-p>',
              paste_behind = '<c-P>',
              replay = '<c-q>', -- replay a macro
              delete = '<c-d>', -- delete an entry
              custom = {},
            },
            n = {
              select = '<cr>',
              paste = 'p',
              --- It is possible to map to more than one key.
              -- paste = { 'p', '<c-p>' },
              paste_behind = 'P',
              replay = 'q',
              delete = 'd',
              custom = {},
            },
          },
        },
      })
      require('telescope').load_extension('neoclip')
    end,
  },
  {
    'ethanholz/nvim-lastplace'
  },
  -- { -- json parser for dap launch.json
  --   -- NOTE: cargo required: https://rustup.rs/
  --   'Joakker/lua-json5',
  --   run = './install.sh'
  -- },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension('dap')
    end
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  {
    "kaicataldo/material.vim",
    branch = "main"
  },
  {
    "cdelledonne/vim-cmake"
  },
  {
    "voldikss/vim-translator"
  },
  {
    'h-hg/fcitx.nvim'
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      cfg = {
        debug = false,                                              -- set to true to enable debug logging
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        verbose = false,                                            -- show debug line number
        bind = true,                                                -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10,                                             -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        max_height = 12,                       -- max height of signature floating_window
        max_width = 80,                        -- max_width of signature floating_window
        noice = false,                         -- set to true if you using noice to render markdown
        wrap = true,                           -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
        floating_window = true,                -- show hint in a floating window, set to false for virtual text only mode
        floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
        -- will set to true when fully tested, set to false will use whichever side has more space
        -- this setting will be helpful if you do not want the PUM and floating win overlap

        floating_window_off_x = 1, -- adjust float windows x position.
        -- can be either a number or function
        floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
        -- can be either number or function, see examples

        close_timeout = 4000,                         -- close floating window after ms when laster parameter is entered
        fix_pos = false,                              -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true,                           -- virtual hint enable
        hint_prefix = "🐼 ",                        -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
        hint_scheme = "String",
        hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
        handler_opts = {
          border = "rounded"                          -- double, rounded, single, shadow, none, or a table of borders
        },
        always_trigger = false,                       -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
        auto_close_after = nil,                       -- autoclose signature float win after x sec, disabled if nil.
        extra_trigger_chars = {},                     -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200,                                 -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
        padding = '',                                 -- character to pad on left and right of signature can be ' ', or '|'  etc
        transparency = nil,                           -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 36,                            -- if you using shadow as border use this set the opacity
        shadow_guibg = 'Black',                       -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        timer_interval = 200,                         -- default timer check interval set to lower value if you want to reduce latency
        toggle_key = nil,                             -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
        select_signature_key = nil,                   -- cycle to next signature, e.g. '<M-n>' function overloading
        move_cursor_key = nil,                        -- imap, use nvim_set_current_win to move cursor between current win and floating
      }

      -- recommended:
      require 'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

      -- You can also do this inside lsp on_attach
      -- note: on_attach deprecated
      require 'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
    end,
  },
  "ray-x/guihua.lua",
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require('notify')
      notify.setup({
        backgroud_colour = '#000000'
      })
      vim.notify = notify
    end
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })

      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    dependencies = { "mfussenegger/nvim-dap" }
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true,                     -- enable this plugin (the default)
        enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,            -- show stop reason when stopped for exceptions
        commented = false,                  -- prefix virtual text with comment string
        only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
        all_references = false,             -- show virtual text on all all references of the variable (not only definitions)

        -- experimental features:
        virt_text_pos = 'eol',  -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,     -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    commit = "1ebbec2053a5d79bfbffc5291396fdbeea41329b",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}

--- dap config
-- load non-standard json file
-- require('dap.ext.vscode').json_decode = require 'json5'.parse
-- require('dap.ext.vscode').load_launchjs()
require("dap.dap-lldb")
-- require("dap.dap-cppdbg")


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "set tabstop=2  shiftwidth=2"
})
