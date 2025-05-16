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
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require("grug-far").setup {
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
        -- be specified
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
}
