" #GRUVBOX Material {{{
set termguicolors
set background=dark
let g:gruvbox_italic = 1
colorscheme gruvbox
" }}}

" #SUPERTAB {{{
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" }}}

" #Lightline {{{
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
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
let g:UltiSnipsSnippetDirectories=["UtilSnips", "snips"]
"}}}

" #NETRW {{{
" Set preferred view
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" }}}

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

" #RIPGREP {{{
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" #CONOLINE {{{
" Highlight the line of the cursor
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
let g:conoline_use_colorscheme_default_normal=1
" }}}

" #VIM GO {{{
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
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

" Open local documentation
let g:go_doc_url = 'http://localhost:6060'

" Search and easily navigate between the function and type definitions within
" the package
au FileType go nmap <leader>d :GoDeclsDir<cr>

" Use snakecase for JSON tags
let g:go_addtags_transform = "snakecase"

" Disable go to definition
let g:go_def_mapping_enabled=0

" Prevent prefilling new files
let g:go_template_autocreate = 0

" Go vet
au FileType go nmap <leader>gv <plug>(go-vet)
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
" }}}

" #FUGITIVE {{{
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
" }}}

" VIM-FLOATERM {{{
let g:floaterm_background = "#282828"
let g:floaterm_position = "center"
let g:floaterm_border_bgcolor = "#282828"
let g:floaterm_keymap_new    = "<F7>"
let g:floaterm_keymap_prev   = "<F8>"
let g:floaterm_keymap_next   = "<F9>"
let g:floaterm_keymap_toggle = "<F10>"
" }}}
