return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      { "3rd/image.nvim", opts = {} },
    },
    lazy = false,
    ---@module "neo-tree"
    config = function()
      vim.keymap.set(
        "n",
        "<leader>e",
        "<Cmd>Neotree<CR>",
        { silent = true, noremap = true, desc = "Open file explorer" }
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require "nvim-treesitter.configs"

      config.setup {
        ensure_installed = {
          "lua",
          "javascript",
          "html",
          "typescript",
          "tsx",
          "yaml",
          "css",
          "dockerfile",
          "vue",
          "json",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
