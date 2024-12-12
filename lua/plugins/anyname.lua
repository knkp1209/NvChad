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
  {
    "luozhiya/fittencode.nvim",
    config = function()
      require("fittencode").setup({
        keymaps = {
          inline = {
            ['hh'] = 'accept_all_suggestions',
          },
        },
      })
    end,
    lazy = false,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },


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
