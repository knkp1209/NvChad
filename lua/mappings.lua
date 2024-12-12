require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", "<cmd>", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })

-- <cmd> 和 : 等效
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "open window" })
map("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "close quickfix", nowait = true })
map("n", "<leader>cl", "<cmd>lclose<CR>", { desc = "close location list", nowait = true })
map("n", "<leader>lds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "Show code structure" })
map("n", "<leader>gq", "<cmd>Gitsigns setqflist<CR>", { desc = "Git set quickfix", nowait = true })
map("n", "<leader>gg", "<cmd>Telescope git_status<CR>", { desc = "open session" })
map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<CR>",
  { desc = "grep string", silent = true })


-- 配合 iterm 终端 分离 ctrl+i 和 tab 键
map("n", "<Esc>CI", "<C-i>", { desc = "Separate <C-i> and Tab in iTerm", silent = true })

-- Telescope mappings
map("n", "<leader>ti", "<cmd>lua require('telescope.builtin').diagnostics()<CR>",
  { desc = "diagnostics", silent = true })

-- Toggle NvimTree
map({ "n", "v" }, "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Separate <C-i> and Tab in iTerm", silent = true })
