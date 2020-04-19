" #PLUGINS {{{
call plug#begin('~/.local/share/nvim/plugged')

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

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
Plug 'mattn/emmet-vim'
Plug 'miyakogi/conoline.vim'
Plug 'ervandew/supertab'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'luochen1990/rainbow'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ap/vim-css-color'
Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'TaDaa/vimade'
Plug 'voldikss/vim-floaterm'
call plug#end()
"}}}
