return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },

  -- Treesitter configuration
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "python","go", "ruby", "php", "tsx", "css", "html", "javascript", "typescript"},  -- Specify the parsers you want
        sync_install = false,             -- Prevent synchronous installation
        auto_install = false,             -- Disable auto-installation on startup
      }
    end
  },
}

