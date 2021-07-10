" ====================================================================
" 			Vim-Plug Settings				
" ====================================================================

" Initialize vim-plug
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}	" Modern parser for highlighting
Plug 'folke/tokyonight.nvim'					" Clean, dark and vibrant
Plug 'reedes/vim-pencil'					" improved writing experience
Plug 'tpope/vim-fugitive'					" git branch in status line
Plug 'junegunn/goyo.vim'					" distraction free writing
Plug 'junegunn/limelight.vim'					" hyperfocused writing
Plug 'ap/vim-css-color'						" css colors highlighted
Plug 'ledger/vim-ledger'					" syntax highlighting for ledger files
Plug 'hoob3rt/lualine.nvim'					" Fancy new statusline
Plug 'nvim-lua/popup.nvim'					" popup ui support
Plug 'nvim-lua/plenary.nvim'					" neovim lua library
Plug 'nvim-telescope/telescope.nvim'				" lua-powered fuzzy finder

" Finish initialization of vim-plug
call plug#end()

" ====================================================================
" 			Vim Color Configuration				
" ====================================================================

set termguicolors
let g:tokyonight_hide_inactive_statusline = 1	" hide statusline on inactive windows
let g:tokyonight_lualine_bold = 1		" bold section headers for the status line
colorscheme tokyonight				" color scheme selection

" ====================================================================
" 			Vim Core Configuration				
" ====================================================================

set scrolloff=7				" Show 7 lines around the cursorline
set number relativenumber		" Enable line numbers
set hidden  				" allow buffer switching without saving
set ignorecase				" ignore case when searching
set smartcase				" search for uppercase only only when you specify uppercase
set cursorline				" Show cursor line
set showtabline =2			" Show tabline always
set guicursor=				" Status bar shows mode; cursor doesn't need to
set clipboard+=unnamedplus		" Enable copy to system clipboard

" ====================================================================
" 			     Keybindings			
" ====================================================================

" Set leader key
let mapleader = ','

" telescope keybindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fd <cmd>Telescope file_browser<cr>

" Switch between buffers quickly
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" ====================================================================
" 			Plugin Configuration			
" ====================================================================

" Set nested folding as the default fold style for vim-markdown-folding
let g:markdown_fold_style = 'nested'

" Configuration for Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is hard

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,gmi call pencil#init()
 autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

" Hide status bar while using fzf commands
if has('nvim') || has('gui_running')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2
endif

" Lualine configuration
lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = {'|', '|'},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filetype'},
    lualine_x = {'encoding', 'fileformat'},
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
  tabline = {
	  lualine_a = {'filename'},
	  lualine_b = {},
	  lualine_c = {},
	  lualine_x = {},
	  lualine_y = {},
	  lualine_z = {}
	  },
  extensions = {}
}
EOF

" ====================================================================
" 			Treesitter Configuration			
" ====================================================================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,
  },
  indent = {
	  enable = true,
	  },
}
EOF

" ====================================================================
" 			Telescope Configuration			
" ====================================================================
lua <<EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=always',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "❯ ",
    selection_caret = "➜ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
	prompt_position = 'bottom',
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF
