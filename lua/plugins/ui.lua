local merge = require("utils.merge").merge

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
      local neoTree = require "neo-tree"

      vim.keymap.set(
        "n",
        "<leader>e",
        "<Cmd>Neotree<CR>",
        { silent = true, noremap = true, desc = "Open file explorer" }
      )

      neoTree.setup {
        filesystem = {
          follow_current_file = true, -- Следовать за открытым файлом
          hijack_netrw_behavior = "open_default", -- Заменить стандартный netrw
          use_libuv_file_watcher = true, -- Автообновление при изменении файлов
          window = {
            mappings = {
              ["l"] = "open", -- Альтернатива Enter для открытия
              ["h"] = "close_node", -- Закрытие папки
              ["a"] = "add", -- Добавить файл
              ["d"] = "delete", -- Удалить файл
              ["r"] = "rename", -- Переименовать файл
            },
          },
        },
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              vim.cmd "Neotree close"
            end,
          },
        },
      }
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
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    version = "^1.7",
    init = function()
      vim.g.barbar_auto_setup = true
    end,
    config = function()
      local barbar = require "barbar"

      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      map("n", "<Tab>", "<cmd>BufferNext<CR>", merge(opts, { desc = "Open next buffer" }))
      map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", merge(opts, { desc = "Open previous buffer" }))
      map("n", "X", "<cmd>BufferClose<CR>", merge(opts, { desc = "Close current buffer" }))
      map(
        "n",
        "<leader>X",
        "<cmd>BufferCloseAllButCurrent<CR>",
        merge(opts, { desc = "Close all without current buffer" })
      )

      barbar.setup {
        modified = { button = "●" },
        pinned = { button = "", filename = true },
        -- Offset bufferline when neo-tree open
        sidebar_filetypes = {
          NvimTree = true,
          undotree = {
            text = "undotree",
            align = "center",
          },
          ["neo-tree"] = { event = "BufWipeout" },
          Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
        },

        -- Icons style
        icons = {
          separator = { left = "", right = "" },
          separator_at_end = false,
          button = "",
          gitsigns = {
            added = { enabled = true, icon = "+" },
            changed = { enabled = true, icon = "~" },
            deleted = { enabled = true, icon = "-" },
          },
          filetype = {
            enabled = false,
          },
        },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require "lualine"

      lualine.setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            "neo-tree",
          },
        },
      }
    end,
  },
}
