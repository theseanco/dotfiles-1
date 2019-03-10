" #GRUVBOX {%
set background=dark
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
colorscheme gruvbox
" %}

" #SUPERTAB {%
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" %}

" #Lightline {%
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }
" %}

" #EMMET {%
let g:user_emmet_expandabbr_key='<C-@>'
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"%}

" #COC {%
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" %}

" #MARKDOWN {%
let g:pencil#textwidth = 80
let g:vim_markdown_folding_disabled = 1
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
let g:markdown_fenced_languages = ['rust', 'css', 'yaml', 'javascript', 'html', 'vim','json']
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'soft'})
augroup END
"%}

" #ALE {%
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['scss'] = ['stylelint', 'prettier']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_javascript_prettier_use_local_config = 1 " respect prettier local files
let g:ale_fix_on_save = 1 " Fix files automatically on save
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Move between linting errors
nnoremap <leader>n :ALENextWrap<CR>
nnoremap <leader>m :ALEPreviousWrap<CR>
nnoremap <F6> :ALEFix<CR>
"%}

" #ULTILSNIPS {%
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=["UtilSnips", "snips"]
"%}

" #NETRW {%
" Set preferred view
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" %}

" #FZF {%
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>t :FzfTags<CR>
" Have FZF list all tracked files plus untracked files minus your ignored files
nnoremap <C-p> :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>g :FzfRg<CR>
nnoremap <Leader>p :FzfFiles<CR>
" %}

" #RIPGREP {%
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" %}

" #CONOLINE {%
" Highlight the line of the cursor
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
" %}
