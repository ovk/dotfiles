" =============================================================================
" General Settings
" =============================================================================
set nocompatible    " Disable Vi compatibility
set nomodeline      " Disable modeline
set hidden          " Allow hidden buffers
set spell           " Enable spell checking
set nobackup        " Do not keep backup file after write
set writebackup     " Create backup and keep until file is written
set noswapfile      " Disable swap files
set noundofile      " Disable persistent undo
set nostartofline   " Try to preserve cursor column

" Set encoding to UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Adjust number formats for increment/decrement
set nrformats=bin,hex,alpha

" Allow backspace to delete across lines and indents (like most programs)
set backspace=indent,eol,start

" Enable filetype plugin, load filetype-specific indent files
filetype plugin indent on

" Enable syntax highlighting
if !exists('g:syntax_on')
    syntax enable
endif

" Use Harmony color scheme from vim-harmony (if available)
try
    colorscheme harmony
catch
endtry

" Don't render HTLM files
let html_no_rendering=1

" Adjust what is saved in session file
set sessionoptions=globals,curdir,buffers,winsize,tabpages,folds,slash,unix

" Set history size and adjust what is saved in viminfo
set history=50
set viminfo='50,<50,s1,@0,h

" Adjust completion options to more traditional
set completeopt=longest,menuone

" =============================================================================
" Spaces & Tabs
" =============================================================================
set tabstop=4       " Set number of visual spaces per tab
set softtabstop=4   " Set number of spaces in tab
set shiftwidth=4    " Set indent width
set shiftround      " Round indents to specified indent width
set expandtab       " Use spaces for tabs
set nojoinspaces    " Use one space (not two) after punctuation

" =============================================================================
" Searching
" =============================================================================
set incsearch       " Enable incremental search
set hlsearch        " Highlight search matches
set ignorecase      " Case-insensitive search by default
set smartcase       " Switch to case-sensitive search if there's capital letter

" =============================================================================
" Folding
" =============================================================================
set nofoldenable    " Open all folds
set foldcolumn=1    " Set width of fold column to 1

" =============================================================================
" UI Settings
" =============================================================================
set number          " Show line numbers
set showcmd         " Show command in the bottom bar (useful in visual mode)
set cursorline      " Highlight current line
set wildmenu        " Enable visual completion menu
set lazyredraw      " Enable lazy redraw
set ttyfast         " Always assume fast TTY
set noshowmatch     " Disable jump to matching bracket
set laststatus=2    " Always display status line
set ruler           " Show cursor position
set nowrap          " Don't wrap lines by default
set noshowmode      " Don't show mode message

" Set characters to display for invisible characters
set listchars=eol:↲,nbsp:␣,tab:▸→,extends:❯,precedes:❮,trail:∙
set showbreak=↪\

" Don't use any fill characters for vertical split, status line and diff
set fillchars=fold:-,diff:\

" =============================================================================
" GUI Settings
" =============================================================================
if has('gui_running')
    set guioptions=ai!
    set lines=50 columns=150
    if has('gui_gtk')
        set guifont=DejaVu\ Sans\ Mono\ 10
    elseif has('gui_win32')
        set guifont=DejaVu_Sans_Mono:h10
    endif
endif

" =============================================================================
" Key Mappings
" =============================================================================
" Map <Space> as leader key
let mapleader = " "

" Clear current search and perform default Ctrl-L action (redraw)
nnoremap <silent> <c-l> :let @/=""<cr><c-l>

" Quick buffer navigation (next/previous)
nnoremap <silent> <c-n> :bnext<CR>
nnoremap <silent> <c-p> :bprev<CR>

" Show omnicompletion on Control+Space
inoremap <c-space> <c-x><c-o>

" =============================================================================
" Autocommands
" =============================================================================
augroup vimrc
    autocmd!

    " Set tab to two spaces for YAML files as it appears to be standard
    autocmd FileType yaml :setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" =============================================================================
" vim-harmony configuration (https://gitlab.com/thealik/vim-harmony)
" =============================================================================
" Enable automatic trailing whitespace removal
let g:harmony#autoremove_trailing_whitespace = 1

" Enable automatic tabs detection (shown in the status line)
let g:harmony#autodetect_tabs = 1

" Enable auto closing of brackets and quotes
let g:harmony#autoclose#enabled = 1

" Tab line
let g:harmony#tabline#enabled = 1
let g:harmony#tabline#file_modified_marker = '∙'

" Status line
let g:harmony#statusline#enabled = 1
let g:harmony#statusline#file_modified_marker = '∙'
let g:harmony#statusline#file_readonly_marker = '⌀ '

" Sessions management
let g:harmony#sessions#enabled = 1
let g:harmony#sessions#save_on_exit = 1
let g:harmony#sessions#menu_prefix = '▷ '
let g:harmony#sessions#menu_prefix_current = '▶ '

" File explorer
let g:harmony#explorer#show_after_session_load = 1
let g:harmony#explorer#collapsed_dir_prefix = '+ '
let g:harmony#explorer#expanded_dir_prefix = '- '
let g:harmony#explorer#file_prefix = '  '
let g:harmony#explorer#indent_prefix = '  '
let g:harmony#explorer#dir_trailing_slash = 0
let g:harmony#explorer#show_dotfiles = 0

" Delete current buffer without closing window
nmap <leader><Backspace> <Plug>(HarmonyCloseCurrentBuffer)

" Navigate through buffers with <leader>F1-F12 keys
for s:i in range(1, 12)
    execute 'nmap <leader><F' . s:i . '> <Plug>HarmonyTablineSwitchTo(' . s:i . ')'
endfor
unlet s:i

" Check and report if buffer contains any tabs
nmap <leader>t <Plug>(HarmonyDetectTabs)

" Session management mappings
nmap <leader>sl <Plug>(HarmonyShowSessionList)
nmap <leader>ss <Plug>(HarmonySaveSession)
nmap <leader>sa <Plug>(HarmonySaveSessionAs)

