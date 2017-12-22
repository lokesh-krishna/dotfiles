" ====================================================================
" 			Vim-Plug Settings				
" ====================================================================

" Initialize vim-plug
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Install fzf system-wide
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plugins
Plug 'arcticicestudio/nord-vim'		" best color scheme ever
Plug 'junegunn/goyo.vim'		" distraction free writing
Plug 'junegunn/limelight.vim'		" hyperfocused writing
Plug 'reedes/vim-pencil'		" improved writing experience
Plug 'itchyny/lightline.vim'		" a really cool status bar
Plug 'tpope/vim-fugitive'		" git branch in status line
Plug 'mgee/lightline-bufferline'	" Show buffers in tabline
Plug 'junegunn/fzf.vim'			" Integrate FZF with vim
Plug 'nelstrom/vim-markdown-folding'	" Fold markdown files by headings
Plug 'machakann/vim-sandwich'		" Surround text objects easily
Plug 'scrooloose/nerdtree'		" File system explorer

" Finish initialization of vim-plug
call plug#end()

" ====================================================================
" 			Vim Color Configuration				
" ====================================================================

set t_Co=256				" Enable support for lots of colors

" Enable italics for Markdown
autocmd ColorScheme nord highlight Italic cterm=italic gui=italic

colorscheme nord			" color scheme selection

" ====================================================================
" 			Vim Core Configuration				
" ====================================================================

set spell				" Enable spell-checking
set scrolloff=7				" Show 7 lines around the cursorline
let g:netrw_banner = 0			" Hide banner shown in the file explorer
let g:netrw_liststyle = 3		" Use tree view in file explorer
set nu					" Enable line numbers
set relativenumber			" line numbers are relative 
set hidden  				" allow buffer switching without saving
set cursorline				" Show cursor line
set showtabline =2			" Show tabline always
set guicursor=				" Status bar shows mode; cursor needn't 

" ====================================================================
" 			     Keybindings			
" ====================================================================

" Define my leader key
let mapleader = ","

" Toggle Goyo 
nnoremap <C-G> :Goyo<CR>

" Trigger FZF's search lines from all buffers
nnoremap <C-F> :Lines<CR>

" Switch between buffers quickly
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" ====================================================================
" 			Plugin Configuration			
" ====================================================================

" Set nested folding as the default fold style for vim-markdown-folding
let g:markdown_fold_style = 'nested'

" Configuration for Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call pencil#init()
 autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

" Lightline 
set noshowmode 				" Hide mode because Lightline handles it 
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'separator': {
      \   'left': '', 
      \   'right':''
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \ }

" Integrate lightline-bufferline with lightline
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Goyo settings
" Disable cursorline highlight, center cursorline and let cursor show mode
function! s:goyo_enter()
  set nocursorline	
  set scrolloff=999
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
endfunction

function! s:goyo_leave()
  set cursorline	
  set scrolloff=7
  set guicursor=
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Hide status bar while using fzf commands
if has('nvim') || has('gui_running')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2
endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
