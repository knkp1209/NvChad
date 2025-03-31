return {
  {
    lazy = false,
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit", -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- {
  --   "luozhiya/fittencode.nvim",
  --   config = function()
  --     require("fittencode").setup({
  --       keymaps = {
  --         inline = {
  --           ['hh'] = 'accept_all_suggestions',
  --         },
  --       },
  --     })
  --   end,
  --   lazy = false,
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader><leader>", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",                mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",                mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",                mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>",            mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  -- {
  --   "olexsmir/gopher.nvim",
  --   ft = "go",
  --   -- branch = "develop", -- if you want develop branch
  --   -- keep in mind, it might break everything
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
  --   },
  --   -- (optional) will update plugin's deps on every update
  --   build = function()
  --     vim.cmd.GoInstallDeps()
  --   end,
  --   ---@type gopher.Config
  --   opts = {},
  -- },
  -- {
  --   -- NOTE: Yes, you can install new plugins here!
  --   'mfussenegger/nvim-dap',
  --   -- NOTE: And you can specify dependencies as well
  --   dependencies = {
  --     -- Creates a beautiful debugger UI
  --     'rcarriga/nvim-dap-ui',
  --
  --     -- Required dependency for nvim-dap-ui
  --     'nvim-neotest/nvim-nio',
  --
  --     -- Installs the debug adapters for you
  --     'williamboman/mason.nvim',
  --     'jay-babu/mason-nvim-dap.nvim',
  --
  --     -- Add your own debuggers here
  --     'leoluz/nvim-dap-go',
  --   },
  --   keys = {
  --     -- Basic debugging keymaps, feel free to change to your liking!
  --     {
  --       '<F5>',
  --       function()
  --         require('dap').continue()
  --       end,
  --       desc = 'Debug: Start/Continue',
  --     },
  --     {
  --       '<F7>',
  --       function()
  --         require('dap').step_into()
  --       end,
  --       desc = 'Debug: Step Into',
  --     },
  --     {
  --       '<F8>',
  --       function()
  --         require('dap').step_over()
  --       end,
  --       desc = 'Debug: Step Over',
  --     },
  --     {
  --       '<leader><F8>',
  --       function()
  --         require('dap').step_out()
  --       end,
  --       desc = 'Debug: Step Out',
  --     },
  --     {
  --       '<leader>C',
  --       function()
  --         require('dap').toggle_breakpoint()
  --       end,
  --       desc = 'Debug: Toggle Breakpoint',
  --     },
  --     {
  --       '<leader>B',
  --       function()
  --         require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
  --       end,
  --       desc = 'Debug: Set Breakpoint',
  --     },
  --     -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
  --     {
  --       '<F9>',
  --       function()
  --         require('dapui').toggle()
  --       end,
  --       desc = 'Debug: See last session result.',
  --     },
  --   },
  --   config = function()
  --     local dap = require 'dap'
  --     local dapui = require 'dapui'
  --
  --
  --     dap.adapters.delve = {
  --       type = 'server',
  --       port = "${port}",
  --       executable = {
  --         command = 'dlv',
  --       }
  --     }
  --
  --     require('mason-nvim-dap').setup {
  --       -- Makes a best effort to setup the various debuggers with
  --       -- reasonable debug configurations
  --       automatic_installation = true,
  --
  --       -- You can provide additional configuration to the handlers,
  --       -- see mason-nvim-dap README for more information
  --       handlers = {},
  --
  --       -- You'll need to check that you have the required things installed
  --       -- online, please don't ask me how to install them :)
  --       ensure_installed = {
  --         -- Update this to ensure that you have the debuggers for the langs you want
  --         'delve',
  --       },
  --     }
  --
  --     -- Dap UI setup
  --     -- For more information, see |:help nvim-dap-ui|
  --     dapui.setup {
  --       -- Set icons to characters that are more likely to work in every terminal.
  --       --    Feel free to remove or use ones that you like more! :)
  --       --    Don't feel like these are good choices.
  --       icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  --       controls = {
  --         icons = {
  --           pause = '⏸',
  --           play = '▶',
  --           step_into = '⏎',
  --           step_over = '⏭',
  --           step_out = '⏮',
  --           step_back = 'b',
  --           run_last = '▶▶',
  --           terminate = '⏹',
  --           disconnect = '⏏',
  --         },
  --       },
  --     }
  --
  --     -- Change breakpoint icons
  --     -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
  --     -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
  --     -- local breakpoint_icons = vim.g.have_nerd_font
  --     --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
  --     --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
  --     -- for type, icon in pairs(breakpoint_icons) do
  --     --   local tp = 'Dap' .. type
  --     --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
  --     --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
  --     -- end
  --
  --     dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  --     dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  --     dap.listeners.before.event_exited['dapui_config'] = dapui.close
  --
  --     -- Install golang specific config
  --     require('dap-go').setup {
  --       delve = {
  --         -- On Windows delve must be run attached or it crashes.
  --         -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
  --         detached = vim.fn.has 'win32' == 0,
  --         args = { '--check-go-version=false' },
  --       },
  --     }
  --   end,
  -- },
  {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";

      vim.keymap.set('i', 'hh', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true

      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
      "CopilotChatSave",
      "CopilotChatLoad",
      "CopilotChatDebugInfo",
      "CopilotChatModels",
      "CopilotChatAgents",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatFixTests",
      "CopilotChatCommit",
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      mappings = {
        complete = {
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = '<C-l>',
          insert = '<C-l>',
        },
        submit_prompt = {
          normal = '<leader><leader>',
          insert = '<leader><leader>',
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  -- {
  --   "fatih/vim-go",
  --   ft = "go",                                                    -- 仅在打开 Go 文件时加载
  --   cmd = { "GoBuild", "GoRun", "GoTest", "GoFmt", "GoImports" }, -- 指定命令触发加载
  --   config = function()
  --     -- vim-go 配置
  --     -- vim.g.go_fmt_command = "goimports"   -- 使用 goimports 进行格式化
  --     -- vim.g.go_metalinter_enabled = { "govet", "golint", "staticcheck" } -- 启用的 linter
  --     vim.g.go_auto_type_info = false      -- 自动显示类型信息
  --     vim.g.go_def_mapping_enabled = false -- 禁用默认的定义跳转映射，避免与 LSP 冲突
  --     -- vim.g.go_list_type = "quickfix"                                    -- 使用 quickfix 列表显示错误
  --     vim.g.go_highlight_functions = 1     -- 高亮函数名
  --     vim.g.go_highlight_types = 0         -- 高亮类型名
  --     -- vim.g.go_term_mode = "split"          -- 使用垂直分割窗口打开终端
  --     vim.g.go_term_enabled = 1            -- 启用终端
  --
  --     -- 可选：设置快捷键
  --     -- vim.api.nvim_set_keymap("n", "<Leader>gb", ":GoBuild<CR>", { noremap = true, silent = true })
  --     -- vim.api.nvim_set_keymap("n", "<Leader>gr", ":GoRun<CR>", { noremap = true, silent = true })
  --     -- vim.api.nvim_set_keymap("n", "<Leader>gt", ":GoTest<CR>", { noremap = true, silent = true })
  --     -- vim.api.nvim_set_keymap("n", "<Leader>gf", ":GoFmt<CR>", { noremap = true, silent = true })
  --     -- vim.api.nvim_set_keymap("n", "<Leader>gi", ":GoImports<CR>", { noremap = true, silent = true })
  --   end,
  --   -- dependencies = {
  --   --   "neoclide/coc.nvim", -- 如果你使用 coc.nvim 作为补全引擎，可以添加相关依赖
  --   -- },
  -- },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>ti",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tI",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup { indent = { highlight = highlight } }
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1;
      vim.g.dbs = {
        { name = 's',              url = 'postgres://postgres:mypassword@localhost:5432/my-dev-db' },
        { name = 'rrzu-dev',       url = 'mysql://root_dev:oursla2023+@dev-open-rrzumha.mysql.polardb.rds.aliyuncs.com/data_center' },
        { name = 'rrzu-dev-zulin', url = 'mysql://root_dev:oursla2023+@dev-open-rrzumha.mysql.polardb.rds.aliyuncs.com/zulin' },
        { name = 'rrzu-test-hg',   url = 'postgres://BASIC$rrzuji_test:oursla2022+@hgprecn-cn-g4t3jum1q003-cn-shenzhen.hologres.aliyuncs.com:80/data_analysis_test' },
        { name = 'simple',         url = 'mysql://root:12345678@127.0.0.1/simple_admin' },
      };
    end,
  },
  {
    "rcarriga/nvim-notify"
  }
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = { "html", "css", "bash", "go" },
  --     highlight = {
  --       enable = true, -- 启用语法高亮
  --       use_languagetree = true,
  --     },
  --
  --     indent = { enable = true },
  --     fold = {
  --       enable = true, -- 启用折叠
  --     },
  --   },
  -- },
}
