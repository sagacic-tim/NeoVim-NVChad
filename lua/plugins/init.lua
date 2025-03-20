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

  -- Add nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#expand"](args.body)
          end,
        },
        mapping = {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),
        },
        sources = {
          { name = 'nvim_lsp' },  -- LSP completions
          { name = 'vsnip' },     -- Snippet completions
          { name = 'buffer' },    -- Buffer completions (from the open buffer)
          { name = 'path' },      -- Path completions
        },
      })
    end
  },

  -- Add lspkind-nvim to add icons to completion
  {
    "onsails/lspkind-nvim",
    config = function()
      require('lspkind').init()
    end
  },

  -- Add cmp-vsnip for snippet completion
  {
    "hrsh7th/cmp-vsnip"
  },

  -- LSP configuration for Go (gopls)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- General LSP setup
      require "configs.lspconfig"

      -- Go LSP configuration
      require'lspconfig'.gopls.setup{
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "go.sum" },
        root_dir = require'lspconfig'.util.root_pattern("go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      }
    end,
  },
}
