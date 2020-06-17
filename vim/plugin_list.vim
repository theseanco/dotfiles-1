" #PLUGINS {{{
call plug#begin('~/.local/share/nvim/plugged')

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Fuzzy Search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'

" Appearance and Themes
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Autocompletion, Linting & Intellisense
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'SirVer/ultisnips'

" Utilities
Plug 'airblade/vim-rooter'
Plug 'moll/vim-bbye'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'luochen1990/rainbow'
Plug 'ludovicchabant/vim-gutentags'
Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
call plug#end()
"}}}
