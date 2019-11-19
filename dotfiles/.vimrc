" File: .vimrc
" Author: Mathieu Crilout <mathieucrilout@mail>
" Date: 09.06.2017

" Basic Config -------------------- {{{

" Deoplete -------------------- {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1 "It increases the screen flicker.
let g:deoplete#sources#jedi#enable_cach = 1
let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set noshowmode
" }}}

" Opt -------------------- {{{
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set encoding=utf-8
set fileformat=unix
set nrformats= "Set decimal format"

set incsearch
set wildmenu
set wildmode=longest:full,full

set autoindent
set number
set expandtab

set tabstop=8
set softtabstop=4
set shiftwidth=4

set cursorline
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

set hidden
" }}}

" Remapping -------------------- {{{
let mapleader = "-"
let maplocalleader = "\\"
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
" Movement enhanced -------------------- {{{
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap ' `
nnoremap ` '
nnoremap <leader>{ <C-o>
nnoremap <leader>} <C-i>
inoremap <c-l> <right>
inoremap <c-h> <left>
nnoremap w W
nnoremap b B
nnoremap e E
nnoremap W w
nnoremap B b
nnoremap E e
nnoremap gE ge
nnoremap J :bprevious!<CR>
nnoremap K :bnext!<CR>
" }}}

" Command line movement remapping -------------------- {{{
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <C-Left>
cnoremap <C-w> <C-Right>
cnoremap <C-j> <Home>
cnoremap <C-k> <End>
cnoremap <C-e> <C-w>
" }}}

" Cool shortcuts -------------------- {{{
nnoremap <leader>D v0d
let file_name = expand('%:t')
nnoremap <leader>r :execute ":!rm ~/.local/share/nvim/swap/\\%home\\%mcrilo33\\%".file_name.".swp"<CR>
" }}}


" }}}

" Vimrc -------------------- {{{
nnoremap <leader>ev :sp ~/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" abbrev -------------------- {{{
augroup abbrevvim
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
augroup END
" }}}

" Grouping -------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

" Code Folding -------------------- {{{
augroup codfolding
  autocmd!
  autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
  autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
  autocmd BufWinEnter *.html setlocal foldmethod=indent
  autocmd BufWinEnter *.html setlocal tabstop=4
  autocmd BufWinEnter *.html setlocal softtabstop=2
  autocmd BufWinEnter *.html setlocal shiftwidth=2
  autocmd BufWinEnter *.js setlocal tabstop=4
  autocmd BufWinEnter *.js setlocal softtabstop=2
  autocmd BufWinEnter *.js setlocal shiftwidth=2
  autocmd BufWinEnter *.scss setlocal tabstop=4
  autocmd BufWinEnter *.scss setlocal softtabstop=2
  autocmd BufWinEnter *.scss setlocal shiftwidth=2
  autocmd BufWinEnter *.css setlocal foldmethod=indent
  autocmd BufWinEnter *.ipy setlocal foldmethod=marker
  autocmd BufWinEnter *.ipy setlocal foldmarker=##,#%%
  autocmd BufWinEnter *.ipy set textwidth=220
  autocmd BufWinEnter *.ipy
    nnoremap <c-d>d :execute "?##"<bar>normal! V<bar>Nkd<CR>
augroup EN

nnoremap <space> za
" }}}

" Pathogen -------------------- {{{
call pathogen#infect()
call pathogen#helptags()
" }}}

" }}}

" Appearance -------------------- {{{

" Rainbow Parentheses -------------------- {{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
"au BufEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}

" CSV files -------------------- {{{
filetype plugin on
" }}}

" Css-color -------------------- {{{
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

let g:cssColorVimDoNotMessMyUpdatetime = 1
" }}}

" Vim-Airline -------------------- {{{
set laststatus=2
set ttimeoutlen=10
set background=light
let g:airline_theme='solarized'
let g:solarized_termcolors=256
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Airline buffers view
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tmuxline#enabled = 0
" }}}

" Solarized colorscheme -------------------- {{{
syntax enable

if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    colorscheme solarized8_dark
else
    let g:solarized_termcolors=256
    colorscheme solarized
endif
"colorscheme flattened_light


" }}}

" }}}

" IDE Features -------------------- {{{

" Arborescence visibility with NerdTree -------------------- {{{
augroup nerdtree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END
map <C-n> :NERDTreeToggle<CR>

" NERDTrees File highlighting
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
" }}}

" Error Detection with Neomake -------------------- {{{

set statusline=%#warningmsg#
set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
set statusline+=%*

autocmd! BufWritePost,BufEnter * Neomake
let g:airline#extensions#neomake#enabled = 1
"let g:neomake_python_pylint_maker = {
  "\ 'args': [
  "\ '-d', 'C0111, C0103, W0611, R0914, E0611, E0401',
  "\ '-f', 'text',
  "\ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
  "\ '-r', 'n'
  "\ ],
  "\ 'errorformat':
  "\ '%A%f:%l:%c:%t: %m,' .
  "\ '%A%f:%l: %m,' .
  "\ '%A%f:(%l): %m,' .
  "\ '%-Z%p^%.%#,' .
  "\ '%-G%.%#',
  "\ }
let g:neomake_python_enabled_makers = ['pylint']

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']

let g:quickfixsigns_protect_sign_rx = '^neomake_'
let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
    \   'text': '⚠',
    \   'texthl': 'NeomakeWarningSign',
    \ }
let g:neomake_message_sign = {
     \   'text': '➤',
     \   'texthl': 'NeomakeMessageSign',
     \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" }}}

" Git version with GitGutter -------------------- {{{
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_enabled=1
let g:gitgutter_max_signs=500
set updatetime=250
" }}}

" Enhanced Navigation with CtrlP, The Silver Searcher and BufferGator -------------------- {{{

" Set CtrlP -------------------- {{{
" Use a leader instead of the actual named binding
nnoremap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nnoremap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>bm :CtrlPMixed<cr>
nnoremap <leader>bs :CtrlPMRU<cr>
" USE :ClearAllCtrlPCaches or rm -rf ~/.cache/ctrlp if you want to ignore new things !!!!
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It al*/so supports works with .svn, .hg, .bzr.
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/Downloads/*
set wildignore+=*.pkl
set wildignore+=*/node_modules/*
set wildignore+=*.pdf
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\vDownloads|Music|Calibre Library|node_modules|tmp|data|exp|[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp|zip|png|csv|pdf|jpg|exe|dll|git|mkv|pkl)$',
  \ 'link': '',
  \ 
  \ }
" bind <leader>* to grep word under cursor
nnoremap <leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind <leader>a to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>a :Ag<SPACE>
" }}}

" The Silver Searcher, enhanced CtrlP -------------------- {{{
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" }}}

" Buffergator -------------------- {{{
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1
" Looper buffers
let g:buffergator_mru_cycle_loop = 1
" Go to the previous buffer open
nnoremap <leader>jj :w<cr>:BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nnoremap <leader>kk :w<cr>:BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
nnoremap <leader>bl :BuffergatorOpen<cr>
" Shared bindings from Solution #1 from earlier
nnoremap <leader>bq :bp <BAR> bd #<cr>
" }}}

" }}}

" Routine Methods -------------------- {{{
function! RunRoutine()
    :w
    if &filetype=="python"
        :lclose
        let fname = expand('%:t')
        execute ':R python' fname
    endif
endfunction

function! CCode()
    :%s/\v^\s+$//g
    :%s/\v\s+$//g
    :%s/\v,(\S)/, \1/g
    :%s/\v(\=|\<|\>) (\=|\<|\>)/\1\2/g
    :%s/\v(\S)(\>\=|\<\=|\>|\<)/\1 \2/g
    :%s/\v(\>\=|\<\=|\>|\<)(\S)/\1 \2/g
    :%s/\v^(\s+\w+)\=(|\s+)/\1 = /g
    ":%s/\v(|\s+)\=(\s+)(\w+)$/ = \3/g
endfunction

" }}}

" Ctags with neotags -------------------- {{{
set tags=./.tags,.tags;$HOME
let g:neotags_enabled = 1
let g:neotags_file = './.tags'
let g:neotags_ctags_args = [
            \ '-L -',
            \ '--fields=+l',
            \ '--c-kinds=+p',
            \ '--c++-kinds=+p',
            \ '--sort=yes',
            \ '--extra=+q'
            \ ]
let g:neotags_run_ctags = 1
let g:neotags_highlight = 1
let g:neotags_recursive = 1
let g:neotags#python#order = 'mfc'
" }}}

" TMUX PART -------------------- {{{

" Vimux -------------------- {{{
command! -nargs=1 R call VimuxRunCommand(<f-args>)
command! RR call VimuxRunLastCommand()
" }}}

let g:VimuxHeight = "50"
let g:VimuxOrientation = "h"

" Command line -------------------- {{{
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set =\e[1;*A"
  execute "set =\e[1;*B"
  execute "set =\e[1;*C"
  execute "set =\e[1;*D"
endif
" }}}

" }}}

" PYTHON PART -------------------- {{{

autocmd FileType python nnoremap <buffer> <C-c><C-d> :VimuxCloseRunner<CR>
autocmd FileType python nnoremap <buffer> <C-c><C-c> :call RunRoutine()<CR>
" Cool abrevations -------------------- {{{
augroup abbrev
    autocmd!
    autocmd FileType python set textwidth=79
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
\<Cr>print('==================================================================== OK')
\<Cr>#%%<up><up>
    autocmd FileType python :iab <buffer> dbg import ipdb; ipdb.set_trace()
    autocmd FileType python :iab <buffer> __d __dict__
    autocmd FileType python :iab <buffer> im import
    autocmd FileType python :iab <buffer> pandas import pandas as pd
    autocmd FileType python :iab <buffer> numpy numpy as np
    autocmd FileType python :iab <buffer> pickle pickle as pkl
    autocmd FileType python :iab <buffer> obj object
    autocmd FileType python :iab <buffer> sf self
    autocmd FileType python :iab <buffer> cl class
    autocmd FileType python :iab <buffer> iff if:<left>
    autocmd FileType python :iab <buffer> elif elif:<left>
    autocmd FileType python :iab <buffer> ret return
    autocmd FileType python :iab <buffer> """ """
\<CR>"""<up>

    autocmd FileType python :iab <buffer> Para Parameters<CR>----------
    autocmd FileType python :iab <buffer> Ret Returns
\<CR>-------
    autocmd FileType python :iab <buffer> Att Attributes
\<CR>----------
augroup END
" }}}

" Cool Methods -------------------- {{{
nnoremap <localleader>o :call SplitTooLongLine()<CR>
function! SplitTooLongLine()
    execute ":.s/\\v,($)@<! ?/,\r/g"
    execute "normal! V'.="
endfunction
vnoremap <localleader>o :s/\v,\n\s*/, /g<CR>
" }}}

" Ipython with CellMode -------------------- {{{
let g:cellmode_default_mappings='0'
vmap <silent> <C-r> :call RunTmuxPythonChunk()<CR>
noremap <silent> <C-b> :call RunTmuxPythonCell(0)<CR>
noremap <silent> <C-g> :call RunTmuxPythonCell(1)<CR>

let g:cellmode_tmux_sessionname=''
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber='2'
" }}}

" python-mode -------------------- {{{
let g:pymode_python = 'python3'
let g:pymode_virtualenv_path = '/local/crilout/.miniconda3'
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX BREAKPOINT'
let g:pymode_doc_bind = '<leader>d'
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_completion_on_dot = 0
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_extract_variable_bind = '<C-c>rw'
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_lint_ignore = ["E0001"]
let g:pymode_lint_cwindow = 0
" }}}

" }}}

" JAVASCRIPT PART -------------------- {{{

augroup abbrev2
    autocmd FileType javascript :iab <buffer> im import
    autocmd FileType javascript :iab <buffer> pr console.log( )<left><left>
    autocmd FileType javascript :iab <buffer> obj object
    autocmd FileType javascript :iab <buffer> sf self
    autocmd FileType javascript :iab <buffer> cl class
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
" Cool abrevations -------------------- {{{
    autocmd FileType javascript :iab <buffer> iff if ()<left>
    autocmd FileType javascript :iab <buffer> cln class
    autocmd FileType javascript :iab <buffer> cln className=
"  }}}

" }}}

" HTML PART -------------------- {{{
 
" Emmet-Vim -------------------- {{{
let g:user_emmet_mode='a' 
" }}}

" Method -------------------- {{{
" Transform HTML to Js
" ;h to transform
" ;q to undo the transformation
vnoremap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
vnoremap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>
augroup htmliab
    autocmd BufWinEnter *.html set textwidth=500
    autocmd BufWinEnter *.html iab <buffer> ea eabc
    autocmd BufWinEnter *.html iab {% {% %}<left><left><left>
    autocmd BufWinEnter *.html iab {# {# #}<left><left><left>
    autocmd BufWinEnter *.html iab /// <!-- --><left><left><left><left>
    autocmd BufWinEnter *.html iab {{ {{ }}<left><left><left>
augroup END
" }}}
 
" }}}

" Header -------------------- {{{
let g:header_field_author = 'Mathieu Crilout'
let g:header_field_author_email = 'mathieucrilout@mail'
map <F4> :AddHeader<CR>
if filereadable(expand('%'))
    " BufRead
else
    call feedkeys("\<F4>")
endif

let file_name = expand('%:t')
if filereadable(file_name) && empty(matchstr(readfile(file_name),'.'))
  let jslint="/*jslint           browser : true,   continue  : true,\n  devel   : true,  indent  : 2,      maxerr    : 50,\n  newcap  : true,  nomen   : true,   plusplus  : true,\n  regexp  : true,  sloppy  : true,   vars      : false,\n  white   : true\n*/\n/*global $, spa */\n\n"
  if "js"==expand('%:e')
    :put =jslint
    if !empty(matchstr(expand('%:t:r'),'model'))
      let model="spa.model = (function (){ return {}; }());\n"
      :put =model
    elseif empty(matchstr(expand('%:t:r'),'shell\|model'))
      let module="\n  " . expand('%:t:r') . " = (function () {\n    //\n    // BEGIN MODULE SCOPE VARIABLES\n    //\n    var\n      configMap = {\n        main_html : String()\n      },\n      stateMap = { $container : null },\n      jqueryMap = {},\n\n      setJqueryMap, configModule, initModule\n      ;\n    //\n    // END MODULE SCOPE VARIABLES\n    //\n\n    //\n    // BEGIN UTILITY METHODS\n    //\n    //\n    // END UTILITY METHODS\n    //\n\n    //\n    // BEGIN DOM METHODS\n    //\n    // Begin DOM method /setJqueryMap/\n    setJqueryMap = function () {\n      var $container = stateMap.$container;\n      jqueryMap = { $container : $container };\n    };\n    // End DOM method /setJqueryMap/\n\n    //\n    // END DOM METHODS\n    //\n\n    //\n    // BEGIN EVENT HANDLERS\n    //\n    //\n    // END EVENT HANDLERS\n    //\n\n    //\n    // BEGIN PUBLIC METHODS\n    //\n    // Begin public method /configModule/\n    // Purpose    : Adjust configuration of allowed keys\n    // Arguments  : A map of settable keys and values\n    //  * color_name - color to use\n    // Settings   :\n    //  * configMap.settable_map declares allowed keys\n    // Returns    : true\n    // Throws     : none\n    //\n    configModule = function ( input_map ) {\n      spa.util.setConfigMap({\n        input_map     : input_map,\n        settable_map  : configMap.settable_map,\n        config_map    : configMap\n      });\n      return true;\n    };\n    // End public method /configModule/\n\n    // Begin Public method /initModule/\n    // Purpose    : Initializes module\n    // Arguments   :\n    //  * $container the jquery element used by this feature\n    // Returns    : true\n    // Throws     : none\n    //\n    initModule = function ( $container ) {\n      $container.html( configMap.main_html );\n      setJqueryMap();\n      return true;\n    };\n    // End PUBLIC method /initModule/\n    \n    return {\n      configModule  : configModule,\n      initModule    : initModule\n    };\n    //\n    // END PUBLIC METHODS\n    //\n\n  }());\n\n"
        :put =module
    endif
  endif
endif
" }}}

" Snippet with UltiSnips -------------------- {{{
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="`"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<C-s>"
let g:UltiSnipsJumpBackwardTrigger="<C-a>"
let g:UltiSnipsEditSplit="horizontal"
" }}}

" Matchit -------------------- {{{ 
:source ~/.vim/bundle/matchit/plugin/matchit.vim
:helptags ~/.vim/bundle/matchit/doc
:filetype plugin on
" }}}
" }}}

" VimFolding (to the end cause badly indented) -------------------- {{{
augroup vimFolding
    autocmd FileType vim :iab <buffer> {{{ " -------------------- {{{
\<Cr>}}}<up><left><left><left><left><left>
augroup END
"  }}}
