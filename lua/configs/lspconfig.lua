-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "gopls", "golangci_lint_ls" }
local nvlsp = require "nvchad.configs.lspconfig"
local map = vim.keymap.set

local ooo = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)
  -- map HERE
  -- vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { buffer = bufnr })

  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "LSP declaration", buffer = bufnr })
  map("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
    { desc = "LSP go to definition", buffer = bufnr })
  map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
    { desc = "LSP references", buffer = bufnr })
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover", buffer = bufnr })
  map("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>",
    { desc = "LSP implementation", buffer = bufnr })
  map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP signature help", buffer = bufnr })
  map("n", "<leader><leader>", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
    { desc = "LSP document symbols", buffer = bufnr })


  -- map("n", "<leader>D", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", { desc = "LSP definition type",   buffer = bufnr  })
  -- map("n", "<leader>ra", "<cmd>lua require('nvchad.renamer').open()<CR>", { desc = "LSP rename",   buffer = bufnr  })
  -- map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code action",   buffer = bufnr  })
  -- map("n", "gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", { desc = "LSP document symbols",   buffer = bufnr  })
  -- map("n", "<leader>lf", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", { desc = "Floating diagnostic",   buffer = bufnr  })
  -- map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' } })<CR>", { desc = "Goto previous diagnostic",   buffer = bufnr  })
  -- map("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' } })<CR>", { desc = "Goto next diagnostic",   buffer = bufnr  })
  -- map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { desc = "Add workspace folder",   buffer = bufnr  })
  -- map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { desc = "Remove workspace folder",   buffer = bufnr  })
  -- map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { desc = "List workspace folders",   buffer = bufnr  })
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = ooo,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
