return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          require("none-ls.diagnostics.eslint_d"),
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.staticcheck,
          null_ls.builtins.diagnostics.mypy, 
          require("none-ls.diagnostics.ruff"),
          require("none-ls.diagnostics.flake8"),
        },
      })
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    end,
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {}),
    vim.keymap.set("n", "<leader>d", function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end, { desc = "Show diagnostics popup" })
  },
}
