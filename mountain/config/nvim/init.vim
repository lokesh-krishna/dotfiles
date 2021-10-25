" ====================================================================
" 			Vim-Plug Settings				
" ====================================================================

" Initialize paq
lua << EOF
require "paq" {
	"savq/paq-nvim";			-- Let paq manage itself
	"nvim-treesitter/nvim-treesitter";	-- Modern parser
	"reedes/vim-pencil";			-- Improved writing experience
	"folke/zen-mode.nvim";			-- Distraction-free mode
	"folke/twilight.nvim";			-- Hyperfocused writing
	"hoob3rt/lualine.nvim";			-- Statusline
	"nvim-lua/popup.nvim";			-- Popup UI 
	"nvim-lua/plenary.nvim";		-- Neovim lua library
	"nvim-telescope/telescope.nvim";	-- Fuzzy finder
	"windwp/nvim-autopairs";		-- Super powerful autopairs
	"lokesh-krishna/mountain.nvim";		-- Dark, neutral colorscheme
	"folke/tokyonight.nvim";		-- Dark, neutral colorscheme
	}
EOF

" ====================================================================
" 			Vim Color Configuration				
" ====================================================================

set termguicolors
colorscheme mountain			" color scheme selection

" ====================================================================
" 			Vim Core Configuration				
" ====================================================================

set scrolloff=7				" Show 7 lines around the cursorline
set number relativenumber		" Enable line numbers
set hidden  				" allow buffer switching without saving
set ignorecase				" ignore case when searching
set smartcase				" search for uppercase specifically only when you specify uppercase
set cursorline				" Show cursor line
set showtabline=1			" Disable tab line
set guicursor=				" Status bar shows mode; cursor doesn't need to
set clipboard+=unnamedplus		" Enable copy to system clipboard
set noshowmode				" Disable mode indicator as it is handled by lualine
set re=1				" Use the original regex engine

" ====================================================================
" 			     Keybindings			
" ====================================================================

" Set leader key
let mapleader = ','

" telescope keybindings
nnoremap <leader>ff 	<cmd>Telescope find_files<cr>
nnoremap <leader>fg 	<cmd>Telescope live_grep<cr>
nnoremap <leader>fb 	<cmd>Telescope buffers<cr>
nnoremap <leader>fd 	<cmd>Telescope file_browser<cr>

" Zen Mode and Twilight toggles
nnoremap <leader>zm 	<cmd>ZenMode<cr>
nnoremap <leader>tw 	<cmd>Twilight<cr>

" Switch between buffers quickly
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" ====================================================================
" 			Plugin Configuration			
" ====================================================================

" Pencil configuration
let g:pencil#wrapModeDefault = 'soft'   " default is hard

augroup pencil
  autocmd!
  	autocmd FileType markdown,mkd,gmi 	call pencil#init()
	autocmd FileType text         		call pencil#init({'wrap': 'hard'})
augroup END

" Autopairs configuration
lua << EOF
--require("nvim-autopairs").setup()
EOF

" ZenMode configuration
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

" Lualine configuration
lua << EOF
require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = 'mountain',
    component_separators = {'|', '|'},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename', 'branch'},
    lualine_c = {},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

" Treesitter configuration
lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,
  }
}
EOF

" Telescope configuration
lua << EOF
require("telescope").setup{
defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "➜ ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        mirror = false,
	prompt_position = 'top',
	preview_width = 120,
      },
    },
    },
  }
EOF
