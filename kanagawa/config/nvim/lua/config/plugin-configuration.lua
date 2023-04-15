-- color scheme configuration
require('kanagawa').setup({
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
          }
        }
      }
    },
  overrides = function(colors)
    return {
      FloatBorder = { bg = "none" },
      NormalFloat = { bg = "none" },
      FloatTitle = { bg = "none" }
    }
  end
})

vim.cmd.colorscheme "kanagawa-wave"

-- Nvim-R configuration
vim.g.R_hl_term = 0
vim.g.R_assign = 0

-- autopairs
require("nvim-autopairs").setup()

local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")

npairs.add_rule(Rule("*", "*", "telekasten"))
npairs.add_rule(Rule("_", "_", "telekasten"))

-- Telekasten configuration
local home = vim.fn.expand("~/sync/zettelkasten")
require('telekasten').setup({
  home          = home,
  dailies       = home .. '/' .. 'daily',
  weeklies      = home .. '/' .. 'weekly',
  templates     = home .. '/' .. 'templates',
  extension     = ".md",

  follow_creates_nonexisting = true,
  dailies_create_nonexisting = true,
  weeklies_create_nonexisting = true,

  template_new_note = home .. '/' .. 'templates/new_note.md',
  template_new_daily = home .. '/' .. 'templates/daily.md',
  template_new_weekly = home .. '/' .. 'templates/weekly.md',

  -- integrate with calendar-vim
  plug_into_calendar = true,
    calendar_opts = {
      weeknm = 4,
      calendar_monday = 1,
      calendar_mark = 'left-fit',
    }
})

-- indent blankline configuration
require("indent_blankline").setup({
  show_current_context = true,
})

-- zen mode configuration
require("zen-mode").setup {
  window = {
    backdrop = 1, 
    height = 0.95,
    options = {
	  relativenumber = false,
	  number = false,
      }
    },
  plugins = {
    options = {
      enabled = true,
      ruler = true,
    },
  twilight = { enabled = false },
  },
}

-- lualine configuration
local colors = {
  blue   = '#7e9cd8',
  cyan   = '#7aa89f',
  black  = '#1f1f28',
  white  = '#dcd7ba',
  red    = '#e46876',
  violet = '#957fb8',
  green  = '#98bb6c',
  grey   = '#363646',
  light_grey = '#727169'
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.light_grey, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.violet } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require("lualine").setup {
  options = {
    icons_enabled = true,
	disabled_filetypes = {'NvimTree'},
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { },
    lualine_x = { '%S' },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
    inactive_sections = {
      lualine_a = {'filename'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'location'}
  },
}

-- treesitter configuration
require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "cmake", "comment", "css", "devicetree", "dockerfile", "fish", "help", "hjson", "html", "http", "javascript", "json5", "jsonc", "latex", "ledger", "lua", "make", "markdown", "ninja", "php", "python", "r", "regex", "rust", "scss", "toml", "vim", "vimdoc", "yaml" }, 
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
    }
}

-- telescope configuration
require("telescope").setup{
  defaults = {
    prompt_prefix = " ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          mirror = false,
          prompt_position = 'top',
          preview_width = 80,
        },
      },
    },
  }

-- nvim-notify configuration
require("notify").setup({
  stages = "fade",
})

vim.notify = require("notify") -- use nvim-notify as default notification manager
require("telescope").load_extension("notify") -- enable notification filtering with telescope

-- nvim-tree configuration
require("nvim-tree").setup({
  view = {
    width = 45,
    number = true,
    relativenumber = true,
      }
})

-- lsp and accessories
-- borders for lspinfo
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- luasnip setup
local luasnip = require('luasnip')

-- lspkind setup
local lspkind = require('lspkind')

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
  end,
      },
  window = {
    completion = cmp.config.window.bordered {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
    documentation = cmp.config.window.bordered {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      --['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-o>'] = cmp.mapping.confirm({ select = true }),
      }),
  sources = {
      { name = "cmp_nvim_r" },
      { name = "nvim_lsp"},
      { name = "buffer", keyword_length = 5 },
      { name = "path" },
      { name = "spell", keyword_length = 5 },
      { name = "calc" },
      { name = "luasnip" },
      },
  formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
      },
  experimental = {
      ghost_text = true,
      }
  })

cmp.setup.cmdline({ '/', '?' },{
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = 'path'}
  }, {
      {name = 'cmdline'}
    })
})

-- setup nvim-cmp-lsp for lsp completions
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- neodev setup
require("neodev").setup()

require'lspconfig'.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- bash language server
require'lspconfig'.bashls.setup{
  capabilities = capabilities,
}

-- html language server

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- css language server
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- json language server
require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}

-- r language language server
require'lspconfig'.r_language_server.setup {
  capabilities = capabilities,
}

-- latex language server
require'lspconfig'.ltex.setup {
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "en-GB",
      --completionEnabled = true,
      },
    },
}

-- nvim-colorizer for those cool hex code colors
require('colorizer').setup()
