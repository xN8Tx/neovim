return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require "conform"

      -- setup formatting
      conform.setup {
        formatters_by_ft = {
          -- prettierd work faster than prettier
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
          -- ["*"] = { "prettierd" }, -- another files
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
        notify_on_error = true,
      }
    end,
  },
}
