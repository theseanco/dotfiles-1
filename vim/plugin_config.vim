" #THEME {{{
set termguicolors
set background=dark
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
" }}}

" #CONOLINE {{{
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
" }}}

" #VIMADE {{{
au! FocusLost * VimadeFadeActive
au! FocusGained * VimadeUnfadeActive
" }}}

" #SUPERTAB {{{
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" }}}

" #LIGHTLINE {{{
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
" }}}

" #EMMET {{{
let g:user_emmet_expandabbr_key='<C-@>'
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"}}}

" #COC {{{
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[c` and `]c` to navigate diagnosticsU
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> [c <Plug>(coc-diagnostic-prev)

" Hide floating windows
nmap <silent> <leader>fh <Plug>(coc-float-hide)
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)"

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format-selected)

" Show all diagnostics
nnoremap <silent> <space>a  :CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :CocListResume<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"}}}

" #ULTILSNIPS {{{
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=["snips"]
"}}}

" #FZF {{{
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>t :FzfBTags<CR>
nnoremap <silent> <Leader>x :FzfCommits<CR>
nnoremap <Leader>T :FzfTags<CR>
" Have FZF list all tracked files plus untracked files minus ignored files
nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>gt :FzfRg<CR>

" floating fzf window with borders
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

function! FZFWithDevIcons()
  let l:fzf_files_options = ' -m --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview "bat --color always --style numbers {2..}"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND.'| devicon-lookup'), '\n')
    return l:files
  endfunction

  function! s:edit_file(items)
    let items = a:items
    let i = 1
    let ln = len(items)
    while i < ln
      let item = items[i]
      let parts = split(item, ' ')
      let file_path = get(parts, 1, '')
      let items[i] = file_path
      let i += 1
    endwhile
    call s:Sink(items)
  endfunction

  let opts = fzf#wrap({})
  let opts.source = <sid>files()
  let s:Sink = opts['sink*']
  let opts['sink*'] = function('s:edit_file')
  let opts.options .= l:fzf_files_options
  call fzf#run(opts)
endfunction

" Open fzf Files
nnoremap <silent> <C-p> :call FZFWithDevIcons()<CR>

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
" }}}

" #VIM-GO {{{
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Disable code completion
let g:go_code_completion_enabled = 0

" Browser to use for |:GoPlay|, |:GoDocBrowser|, and |:GoLSPDebugBrowser|.
let g:go_play_browser_command = 'firefox %URL% &'

" Automatically import packages on save
let g:go_fmt_command = "goimports"

" Prevent errors from opening the location list
let g:go_fmt_fail_silently = 1

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

" Use updatetime instead
let g:go_updatetime = 0

" Use pop up window instead of preview window
let g:go_doc_popup_window = 1

" Open local documentation
let g:go_doc_url = 'http://localhost:6060'

" Search and easily navigate between the function and type definitions within
" the package
au FileType go nmap <leader>d :GoDeclsDir<cr>

" Gorename
au FileType go nmap <space>n <Plug>(go-rename)

" Generate if err != nil { return ... }  and automatically infer the type of
" return values and the numbers.
au FileType go nmap <space>b <Plug>(go-iferr)

" Gorun
au FileType go nmap <space>r <Plug>(go-run)

" Easily add struct tags
au FileType go nmap <leader>gat :GoAddTags<cr>

" Use snakecase for JSON tags
let g:go_addtags_transform = "snakecase"

" Disable go to definition. Handled by CoC
let g:go_def_mapping_enabled=0

" Prevent prefilling new files
let g:go_template_autocreate = 0

" Go vet
au FileType go nmap <leader>gv <Plug>(go-vet)
" }}}

" #GUTENTAGS {{{
let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/ayo/.vimignore'"
" }}}

" #SIGNIFY {{{
" Check for only Git
let g:signify_vcs_list = [ 'git' ]

" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" Hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)

" Change default symbols
let g:signify_sign_add               = '⏩'
let g:signify_sign_delete            = '🔴'
let g:signify_sign_delete_first_line = '⛔'
let g:signify_sign_change            = '🔄'
" }}}

" #FUGITIVE {{{
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
" }}}

" RAINBOW {{{
let g:rainbow_active = 1
" }}}

" VIM-BBYE {{{
" Delete buffer completely without messing up window layout
nnoremap <leader>q :Bwipeout<CR>
" }}}

" VIM-PANDOC-SYNTAX {{{
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
" }}}

" VIM-MARKDOWN {{{
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, provided by vim-pandoc-syntax
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter
let g:vim_markdown_frontmatter = 1  " for YAML format
" }}}

" VIM-QF {{{
" Jump to and from location/quickfix windows.
nmap <leader>l <Plug>(qf_qf_switch)

" Toggle the quickfix list window
nmap <F5> <Plug>(qf_qf_toggle)

" Toggle the location list window
nmap <F6> <Plug>(qf_loc_toggle)
" }}}
