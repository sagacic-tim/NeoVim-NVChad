-- ~/.config/nvim/lua/plugins/nvim-treesitter.lua
require'nvim-treesitter.configs'.setup {
  -- Ensure these parsers are installed
  ensure_installed = {
    "go", "ruby", "php", "tsx", "css", "html", "javascript", "typescript"
  },

  -- Enable highlighting
  highlight = {
    enable = true,  -- Enable Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false,  -- Disable Vim regex-based highlighting
  },

  -- Enable indentation
  indent = {
    enable = true,  -- Enable Treesitter-based indentation
  },

  -- Enable autotagging for HTML/XML (optional)
  autotag = {
    enable = true,
  },

  -- Enable folding (optional)
  fold = {
    enable = true,
  },
}

