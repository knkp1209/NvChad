return {
  {
    "chaozwn/goctl.nvim",
    ft = { "goctl" },
    enabled = vim.fn.executable "goctl" == 1,
    opts = function()
      -- format when write file
      vim.api.nvim_command("au BufWritePre *.api lua require('goctl.api').format()")

      local group = vim.api.nvim_create_augroup("GoctlAutocmd", { clear = true })



      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "goctl",
        callback = function()
          -- set up format keymap
          vim.keymap.set(
            "n",
            "<Leader>lf",
            "<Cmd>GoctlApiFormat<CR>",
            { silent = true, noremap = true, buffer = true, desc = "Format Buffer" }
          )
        end,
      })
    end,
  },
}
