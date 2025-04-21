return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "filipdutescu/renamer.nvim",
    event = "VeryLazy",
    branch = "master",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("renamer").setup()
    end,

    keys = {
      {
        "<leader>rn",
        function()
          require("renamer").rename()
        end,
        desc = "Rename",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "rhysd/git-messenger.vim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gm",
        function()
          vim.cmd "GitMessenger"
        end,
        desc = "Git Messenger",
      },
    },
  },
}
