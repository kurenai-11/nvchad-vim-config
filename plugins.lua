local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right"
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "html", "css", "bash", "javascript", "typescript", "tsx", "json", "dart", "markdown",
        "markdown_inline" },
      autotag = {
        enable = true
      }
    },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy"
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "prettier",
        "prettierd",
        "eslint_d"
      },
    },
  },
  {
    'stevearc/dressing.nvim',
    lazy = false,
  },
  {
    'akinsho/flutter-tools.nvim',
    ft = "dart",
    opts = {
      color = {
        enabled = true,
        background = true,
        foreground = true,
      },
      lsp = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    }
  }
}
return plugins
