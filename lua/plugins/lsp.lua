local servers = {
  "lua_ls",
  "ts_ls",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "html",
  "jsonls",
  "tailwindcss",
}

return {
  -- download lsp without headache
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- special to download necessary lsp by default
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = servers,
      }
    end,
  },
  -- special to install anything in mason
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      local mason_tool_installer = require "mason-tool-installer"

      mason_tool_installer.setup {
        ensure_installed = {
          "eslint_d",
          "prettierd",
          "codespell",
          "stylua",
        },
      }
    end,
  },
  -- special fro connect nvim and lsp
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "williamboman/mason-lspconfig.nvim", "williamboman/mason.nvim" },
    config = function(_, opts)
      local lspconfig = require "lspconfig"

      -- setup lsp and autosuggestions
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
        }

        lspconfig[server].setup(opts)
      end

      -- custom config
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
          },
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Источники автодополнения
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- LuaSnip и поддержка сниппетов
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Иконки (опционально)
      "onsails/lspkind.nvim",

      -- Готовые сниппеты (опционально)
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        formatting = {
          format = require("lspkind").cmp_format {
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          },
        },
      }
    end,
  },
}
