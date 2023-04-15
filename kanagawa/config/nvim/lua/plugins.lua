return {
  "tpope/vim-fugitive",
  -- aesethetics
  "rebelot/kanagawa.nvim",
  "norcalli/nvim-colorizer.lua",
  {
    "kyazdani42/nvim-web-devicons",
    config = function ()
      require("nvim-web-devicons").setup()
    end,
  },
  -- syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "fladson/vim-kitty",
  "neoclide/jsonc.vim",
  "lokesh-krishna/gemini-vim-syntax",
  -- completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "jalvesaq/cmp-nvim-r",
      "hrsh7th/cmp-cmdline"
    },
  },
  -- writing
  "windwp/nvim-autopairs",
  "folke/zen-mode.nvim",
  "folke/twilight.nvim",
  "mbbill/undotree",
  {
    "kylechui/nvim-surround",
    config = function ()
      require("nvim-surround").setup()
    end,
  },
  "renerocksai/telekasten.nvim",
  -- ui
  "lukas-reineke/indent-blankline.nvim",
  "nvim-lualine/lualine.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup()
    end,
  },
  "kyazdani42/nvim-tree.lua",
  "mattn/calendar-vim",
  "rcarriga/nvim-notify",
  -- telescope
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  -- lsp
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind-nvim",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "folke/trouble.nvim",
  -- programming
  "jalvesaq/Nvim-R",
  {
    "folke/neodev.nvim",
    config = function ()
      require("neodev").setup()
    end
  }
}
