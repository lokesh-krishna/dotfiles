" ==============================
" packer configuration
" ==============================
lua require('plugins')      

" autorun :PackerCompile whenever plugins.lua is updated
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" ==============================
" general configuration
" ==============================

" color configuration
set termguicolors                       " enable 24-bit RGB colors

" core configuration				
set scrolloff=7				            " show 7 lines around the cursorline
set tabstop=4				            " length of a tab
set expandtab				            " tab uses tabstop length
set shiftwidth=4			            " level of indentation
set number relativenumber	            " enable line numbers
set hidden  				            " allow buffer switching without saving
set ignorecase				            " ignore case when searching
set smartcase				            " search for uppercase specifically only when you specify uppercase
set cursorline				            " show cursor line
set showtabline=1			            " disable tab line
set guicursor=				            " status bar shows mode; cursor doesn't need to
set clipboard+=unnamedplus	            " enable copy to system clipboard
set noshowmode				            " disable mode indicator as it is handled by lualine
set spelllang=en_us                     " set language for spell checking
set completeopt=menu,menuone,noselect   " options for completion menu
"set re=1                               " original regex engine

" ==============================
" keybindings
" ==============================
" set leader key
let mapleader = ','

" telescope keybindings
nnoremap <leader>ff 	<cmd>Telescope find_files<cr>
nnoremap <leader>fg 	<cmd>Telescope live_grep<cr>
nnoremap <leader>fb 	<cmd>Telescope buffers<cr>
nnoremap <leader>fd 	<cmd>Telescope file_browser<cr>
nnoremap <leader>fs     <cmd>Telescope spell_suggest<cr>

" switch between buffers quickly
nnoremap <C-n> :bn<cr>
nnoremap <C-p> :bp<cr>

" zenmode and twilight toggles
nnoremap <leader>zm 	<cmd>ZenMode<cr>
nnoremap <leader>tw 	<cmd>Twilight<cr>

" nvim-tree keybindings
nnoremap <leader>nt	<cmd>NvimTreeToggle<cr>

" telekasten bindings 
nnoremap <leader>tf <cmd>Telekasten find_notes<CR>
nnoremap <leader>td <cmd>Telekasten find_daily_notes<CR>
nnoremap <leader>tg <cmd>Telekasten search_notes<CR>
nnoremap <leader>tz <cmd>Telekasten follow_link<CR>
nnoremap <leader>tt <cmd>Telekasten goto_today<CR>
nnoremap <leader>tw <cmd>Telekasten find_weekly_notes<CR>
nnoremap <leader>tn <cmd>Telekasten new_note<CR>
nnoremap <leader>ty <cmd>Telekasten yank_notelink<CR>
nnoremap <leader>tc <cmd>Telekasten show_calendar<CR>
nnoremap <leader>tb <cmd>Telekasten show_backlinks<CR>
nnoremap <leader>tB <cmd>Telekasten find_friends<CR>
nnoremap <leader>t# <cmd>Telekasten show_tags<CR>

" we could define [[ in **insert mode** to call insert link
" inoremap [[ <ESC>:lua require('telekasten').insert_link()<CR>
" alternatively: leader [
inoremap <leader>[ <ESC>:lua require('telekasten').insert_link()<CR>


" lsp bindings
nnoremap <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ls <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>lp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>ln <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>tr <cmd>TroubleToggle<cr>

" ==============================
" plugin configuration
" ==============================

" pencil configuration
let g:pencil#wrapModeDefault = 'soft'  

augroup pencil
	autocmd!
  		autocmd FileType markdown,mkd,gmi 	    call pencil#init()
		autocmd FileType text         		    call pencil#init({'wrap': 'hard'})
        autocmd FileType markdown,mkd,gmi,text  set spell
augroup END

" telekasten configuration 
lua << EOF
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
EOF

" autopairs configuration
lua << EOF
require("nvim-autopairs").setup()
EOF

" catppuccin configuration 
lua << EOF
require("catppuccin").setup()
vim.cmd[[colorscheme catppuccin]]
EOF


" zenmode configuration
lua << EOF
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
EOF

" lualine configuration
lua << EOF

require("lualine").setup {
  options = {
    icons_enabled = true,
	disabled_filetypes = {'NvimTree'},
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
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
  tabline = {},
  extensions = {}
}
EOF

" treesitter configuration
lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
    }
}
EOF

" telescope configuration
lua << EOF
require("telescope").setup{
  defaults = {
    prompt_prefix = " ",
      selection_caret = " ",
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
EOF

" gitsigns configuration
lua << EOF
require("gitsigns").setup()
EOF

" nvim-web-devicons setup
lua << EOF
require("nvim-web-devicons").setup()
EOF

" nvim-tree setup
lua << EOF
require("nvim-tree").setup()
EOF

" lsp and accessories
lua << EOF

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
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
  sources = {
      { name = "buffer", keyword_length = 5 },
      { name = "path" },
      { name = "spell", keyword_length = 5 },
      { name = "calc" },
      { name = "emoji" },
      { name = "nvim_lsp"},
      { name = "nvim_lua"},
      { name = "luasnip" },
      },
  formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
      },
  experimental = {
      native_menu = false,
      ghost_text = true,
      }
  })

-- lua-language-server
local system_name
if vim.fn.has("unix") == 1 then
    system_name = "Linux"
else
    print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation
local sumneko_binary = "/usr/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- setup nvim-cmp-lsp for lsp completions
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E"};
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
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- bash language server
require'lspconfig'.bashls.setup{
  capabilities = capabilities,
}
EOF
