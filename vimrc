" Configuration file for Vi Improved, save as ~/.vimrc to use.

" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible

" set mouse for all modes
"if has('mouse')
"          set mouse=a
"endif

highlight Search guibg=none guifg=none gui=underline
hi stupid ctermbg=Red guibg=Red
"set number
syntax on " enable syntax highlighting
colorscheme desert
"colo delek
"colo desert

" display settings
set encoding=utf-8 " encoding used for displaying file
set ruler " show the cursor position all the time
set cursorline
"set cursorcolumn
hi CursorLine term=bold cterm=bold guibg=Grey40
hi CursorLine cterm=NONE ctermbg=white guibg=white
hi CursorColumn cterm=NONE ctermbg=white guibg=white
set statusline+=%F\ %l\:%c
set showmatch " highlight matching braces
set showmode " show insert/replace/visual mode

" write settings
set confirm " confirm :q in case of unsaved changes
set fileencoding=utf-8 " encoding used when saving file
set nobackup " do not keep the backup~ file

" edit settings
"set backspace=indent,eol,start " backspacing over everything in insert mode
set expandtab " fill tabs with spaces
set nojoinspaces " no extra space after '.' when joining lines
set shiftwidth=8 " set indentation depth to 8 columns
set softtabstop=8 " backspacing over 8 spaces like over tabs
set tabstop=8 " set tabulator length to 8 columns
"set textwidth=80 " wrap lines automatically at 80th column

" search settings
set hlsearch " highlight search results
set ignorecase " do case insensitive search...
set incsearch " do incremental search
set smartcase " ...unless capital letters are used

" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code

"set background=dark " dark background for console
syntax enable " enable syntax highlighting
syntax on " enable syntax highlighting
colorscheme desert

" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" tuning for gVim only
if has('gui_running')
        set background=light " light background for GUI
        set columns=84 lines=48 " GUI window geometry
        set guifont=Monospace\ 12 " font for GUI window
        set number " show line numbers
endif

" automatic commands
if has('autocmd')
        "remember the old lines of commands
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
        " file type specific automatic commands

        " tuning textwidth for Java code
"       autocmd FileType java setlocal textwidth=132
"       if has('gui_running')
"               autocmd FileType java setlocal columns=136
"       endif

        " don't replace Tabs with spaces when editing makefiles
        autocmd Filetype makefile setlocal noexpandtab

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge

        "autoformat perl
        filetype plugin indent on
        autocmd FileType perl setlocal equalprg=perltidy\ -st
endif

" general key mappings

" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a

" --- vim map (macro) commands ---
map #1 :set nu
map #2 :set nonumber
map #3 :set mouse=a
map #4 :set mouse=
map #5 :%s/\(^.*PARTERN.*$\)/#\1/
map #6 :5j20
map #7 :r filename
map #8 :set cursorline
