return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require "conform"

      -- setup formatting
      conform.setup {
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          yaml = { "prettierd" },
          json = { "prettierd" },
          markdown = { "prettierd" },
          graphql = { "prettierd" },
          vue = { "prettierd" },
          lua = { "stylua" },
          scss = { "prettierd" },
          astro = { "prettierd" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
        notify_on_error = true,
      }

      -- Use lint fix after save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.vue", "*.astro" },
        command = "silent! EslintFixAll",
        group = vim.api.nvim_create_augroup("MyAutocmdsJavaScripFormatting", {}),
      })
    end,
  },
}
