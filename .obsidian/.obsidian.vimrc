call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'puremourning/vimspector'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'unblevable/quick-scope'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'APZelos/blamer.nvim'
call plug#end()

" SETTINGS  -------------------------------------------------------------- {{{
filetype on        " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on " Enable plugins and load plugin for the detected file type.
filetype indent on " Load an indent file for the detected file type.
syntax on          " Turn syntax highlighting on.

set nocompatible   " Disable compatibility with vi which can cause unexpected issues.
set number         " Add numbers to each line on the left-hand side.
set cursorline     " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn   " Highlight cursor line underneath the cursor vertically.
set shiftwidth=4   " Set shift width to 4 spaces.
set tabstop=4      " Set tab width to 4 columns.
" set expandtab      " Use space characters instead of tabs.
set nobackup       " Do not save backup files.
set noswapfile
set nowritebackup
set incsearch      " While searching though a file incrementally highlight matching characters as you type.
set hlsearch       " Use highlighting when doing a search.
set mouse=a
set title
set wrap
setlocal wrap
set encoding=UTF-8

colorscheme gruvbox
set background=dark
set cursorline
set hidden
set list
set listchars=tab:»·,trail:·
set wildmenu                                                                 " Enable auto completion menu after pressing TAB.
set wildmode=list:longest                                                    " Make wildmenu behave like similar to Bash completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Wildmenu will ignore files with these extensions.

set backspace=indent,eol,start                                               " Allow backspacing over everything in insert mode.
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
let mapleader = "\<Space>"

noremap <leader>h ^
noremap <leader>l $

inoremap jj <Esc>
cnoremap jk <Esc>
vnoremap jl <Esc>

" Make window navigation easier by not using Control
nnoremap <TAB>j <c-w>j
nnoremap <TAB>h <c-w>h
nnoremap <TAB>k <c-w>k
nnoremap <TAB>l <c-w>l

" Unhighlight search results
nnoremap <leader>nh :nohlsearch<cr>

" Quick opening/sourcing of .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Add empty lines without leaving normal mode
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>k

" Wrap words or selections in quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>` <esc>`<i`<esc>`>la`<esc>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel

" Search selection with * in visual mode
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" Launch NERDTree on start-up
autocmd VimEnter * NERDTree
let g:NERDTreeShowHidden=1

" This will enable code folding.
" Use the marker method of folding.
" augroup filetype_vim
"    autocmd!
"    autocmd filetype vim setlocal foldmethod=marker
" augroup end

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" }}}

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}

