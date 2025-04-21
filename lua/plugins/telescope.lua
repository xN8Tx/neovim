local merge = require("utils.merge").merge

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "andrew-george/telescope-themes",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require "telescope"
      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      local builtin = require "telescope.builtin"

      map("n", "<leader>ff", builtin.find_files, merge(opts, { desc = "Find files" }))
      map("n", "<leader>fw", builtin.live_grep, merge(opts, { desc = "Find by words" }))
      map("n", "<leader>fb", builtin.buffers, merge(opts, { desc = "Watch buffers" }))
      -- map("n", "<leader>fh", builtin.help_tags, opts)
      -- map("n", "<leader>gb", builtin.git_branches, opts)
      map("n", "<leader>gc", builtin.git_commits, opts)
      -- map("n", "<leader>gs", builtin.git_status, opts)
      -- map("n", "<leader>ls", builtin.lsp_document_symbols, opts)
      map("n", "<leader>th", ":Telescope themes<CR>", merge(opts, { desc = "Theme Switcher" }))
      map("n", "gr", builtin.lsp_references, merge(opts, { desc = "Go reference " }))
      map("n", "gd", builtin.lsp_definitions, merge(opts, { desc = "Go definitions" }))

      telescope.setup {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            height = 0.9,
            prompt_position = "top",
            preview_width = 0.6,
            width = 0.9,
          },
        },
        pickers = {
          find_files = {
            layout_strategy = "horizontal",
            theme = "dropdown",
            layout_config = {
              height = 0.9,
              prompt_position = "top",
              preview_width = 0,
              width = 0.9,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          themes = {
            persist = {
              -- enable persisting last theme choice
              enabled = true,

              -- override path to file that execute colorscheme command
              path = vim.fn.stdpath "config" .. "/lua/config/colorscheme.lua",
            },
          },
        },
      }

      telescope.load_extension "fzf"
      telescope.load_extension "themes"
    end,
  },
}
