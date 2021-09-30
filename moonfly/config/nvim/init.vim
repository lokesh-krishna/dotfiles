" load packer
lua require('plugins')      

" autorun :PackerCompile whenever plugins.lua is updated
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" color configuration
set termguicolors           " enable 24-bit RGB colors
colorscheme moonfly 		" color scheme selection

" core configuration				
set scrolloff=7				" show 7 lines around the cursorline
set tabstop=4				" length of a tab
set expandtab				" tab uses tabstop length
set shiftwidth=4			" level of indentation
set number relativenumber	" enable line numbers
set hidden  				" allow buffer switching without saving
set ignorecase				" ignore case when searching
set smartcase				" search for uppercase specifically only when you specify uppercase
set cursorline				" show cursor line
set showtabline=1			" disable tab line
set guicursor=				" status bar shows mode; cursor doesn't need to
set clipboard+=unnamedplus	" enable copy to system clipboard
set noshowmode				" disable mode indicator as it is handled by lualine
set re=1				    " use the original regex engine 

" keybindings			
" set leader key
let mapleader = ','

" telescope keybindings
nnoremap <leader>ff 	<cmd>Telescope find_files<cr>
nnoremap <leader>fg 	<cmd>Telescope live_grep<cr>
nnoremap <leader>fb 	<cmd>Telescope buffers<cr>
nnoremap <leader>fd 	<cmd>Telescope file_browser<cr>

" switch between buffers quickly
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" zenmode and twilight toggles
nnoremap <leader>zm 	<cmd>ZenMode<cr>
nnoremap <leader>tw 	<cmd>Twilight<cr>

" nvim-tree keybindings
nnoremap <leader>nt	<cmd>NvimTreeToggle<cr>

" pencil configuration
let g:pencil#wrapModeDefault = 'soft'  

augroup pencil
	autocmd!
  		autocmd FileType markdown,mkd,gmi 	call pencil#init()
		autocmd FileType text         		call pencil#init({'wrap': 'hard'})
	augroup END

" autopairs configuration
lua << EOF
require("nvim-autopairs").setup()
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
	theme = 'moonfly',
	component_separators = {left = '|', right = '|'},
	section_separators = {left = '', right = ''},
},
  sections = {
    lualine_a = {
	{
      'mode',
	  separator = {left = '', right = ''},
      padding = { left = 1, right = 2 },
      }
    },
    lualine_b = {
      {
      'filename',
      padding = { left = 2, right = 2 },
    },
      { 
      'branch',
      padding = { left = 2, right = 2 },
      }
    },
    lualine_c = {'fileformat'},
    lualine_x = {},
    lualine_y = {
      {
      'filetype',
      padding = { left = 2, right = 2 },
	  },
      {
      'progress',
      padding = { left = 2, right = 2 },
      } 
    },
    lualine_z = {
    {
    'location',
        separator = {left = '', right = ''},
          padding = { left = 2, right = 1 },
        }
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
          preview_width = 100,
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
