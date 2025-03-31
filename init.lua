vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)



vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt_local.foldenable = true
    vim.opt_local.foldlevelstart = 0
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us", "cjk" }
  end,
})


vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.api",
  callback = function()
    vim.bo.filetype = "goctl"
  end,
})



-- 自动删除行尾空格
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     vim.cmd [[%s/\s\+$//e]]
--     vim.lsp.buf.format { async = false }
--   end
-- })
--

-- 针对 Go 文件类型设置缩进规则
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false -- 使用制表符而不是空格
    -- vim.lsp.buf.format { async = false }
  end,
})

-- 针对 PHP 文件类型设置缩进规则
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true -- 使用制表符而不是空格
    -- vim.lsp.buf.format { async = false }
  end,
})

-- 输入法配置 start ------------------------------

-- 记录当前输入法
local current_input_method = vim.fn.system("/usr/local/bin/macism")

-- 切换到英文输入法
local function switch_to_english_input_method()
  current_input_method = vim.fn.system("/usr/local/bin/macism")
  if current_input_method ~= "com.apple.keylayout.ABC\n" then
    vim.fn.system("/usr/local/bin/macism com.apple.keylayout.ABC")
  end
end

-- 设置输入法
-- local function set_input_method()
--   if current_input_method ~= "com.apple.keylayout.ABC\n" then
--     vim.fn.system("/usr/local/bin/macism " .. vim.trim(current_input_method))
--   end
-- end
--
-- 定义自动命令组
vim.api.nvim_create_augroup("InputMethod", { clear = true })

-- -- 进入 Insert 模式时恢复原输入法
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   group = "InputMethod",
--   callback = set_input_method,
-- })

-- 离开 Insert 模式时切换到英文输入法
vim.api.nvim_create_autocmd("InsertLeave", {
  group = "InputMethod",
  callback = switch_to_english_input_method,
})

-- 输入法配置 end ------------------------------

-- 文件自动保存 start --------------------------
-- local timer = vim.loop.new_timer() -- 创建一个定时器
--
-- if not timer then
--   print("Failed to create timer") -- Handle timer creation failure
--   return
-- end
--
-- timer:start(0, 10000, vim.schedule_wrap(function()
--   -- Ensure buffer is valid and has modifications before saving
--   local buf_name = vim.fn.expand('%')
--   if vim.bo.modified and buf_name and buf_name ~= '' then
--     vim.cmd('write') -- Save the file
--   end
-- end))
--
-- -- Clean up the timer when exiting Neovim
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   callback = function()
--     if timer then
--       timer:stop()  -- Stop the timer
--       timer:close() -- Free resources
--     end
--   end,
-- })

-- 文件自动保存 end   --------------------------
--
--
