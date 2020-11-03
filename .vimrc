set nocompatible
set encoding=utf-8
set nospell
let maplocalleader=" "
if has('nvim')
    set inccommand=nosplit
    set incsearch
endif
set incsearch
set dictionary+=~/words
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/british-english
set dictionary+=/usr/share/dict/words
set dictionary+=/usr/share/dict/cracklib-small
set complete+=.,w,b,u,t,i
let uname = substitute(system('uname'), '\n', '', '')
syntax on
filetype on
filetype indent plugin on    " required
syn on

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction


" PLUGIN INSTALL USING VIM-PLUG (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically download and install vim-plug if it's not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" Leader tt toggles checkbox
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'jupyter-vim/jupyter-vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'RRethy/vim-illuminate'
Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'Glench/Vim-Jinja2-Syntax' " Jinja Filetype syntax hl
Plug 'HansPinckaers/ncm2-jedi'
Plug 'kovisoft/paredit'
Plug 'KabbAmine/zeavim.vim' " Zea Documentation Tool
Plug 'Konfekt/FastFold' "Required by vim-coiled-snake
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Raku/vim-raku' " For raku perl 6 support
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet-snippets' " Snippets
Plug 'Shougo/neosnippet.vim' " Snippets
Plug 'SirVer/ultisnips' " Snippets
Plug 'airblade/vim-gitgutter' "Git Status
Plug 'alvan/vim-closetag' "autoclose html,xml,j2 files
Plug 'ap/vim-css-color' "show colors of hex,name colors
Plug 'bfrg/vim-jq',{'for':'json'} "json query parser
Plug 'bfrg/vim-jqplay',{'for':'json'} "json query parser
Plug 'chrisbra/csv.vim',{'for':'csv'} "csv pretty display
Plug 'cloudhead/neovim-fuzzy'
Plug 'derekwyatt/vim-scala',{'for': ['scala','sbt']} "scala syntax
Plug 'dhruvasagar/vim-table-mode' "easy markdown tables
Plug 'ehamberg/vim-cute-python',{'for':'python','branch':'master'} "pretty math symbols
Plug 'elixir-editors/vim-elixir',{'for':'elixir'}
Plug 'enricobacis/vim-airline-clock'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' } "Scala ide features for vim
Plug 'garbas/vim-snipmate' "snipmate snippets
Plug 'gcorne/vim-sass-lint',{'for':['css', 'sass', 'scss', 'less']}
Plug 'glts/vim-magnum' "required by radical
Plug 'glts/vim-radical' "crx,crd,cro,crb gA covert w under cursor to hex,dec,oct,bin
Plug 'godlygeek/tabular' "Tabularize /,  /,/r0c1l1
Plug 'honza/vim-snippets' "snippets
Plug 'jceb/vim-orgmode',{'for':'org'} "orgmode files
Plug 'jiangmiao/auto-pairs' "autopair []''(){}
Plug 'jkramer/vim-checkbox',{'for':'markdown'} "insert checkbox or toggle tt
Plug 'jmcantrell/vim-virtualenv',{'for':'python'} "virtualenv py
Plug 'junegunn/fzf',{'dir':'~/.fzf','do':'./install --all'} "Fzf
Plug 'junegunn/fzf.vim' "Fzf
Plug 'junegunn/vim-emoji' "emojis
Plug 'justinmk/vim-sneak' "The missing motion for vim
Plug 'kalekundert/vim-coiled-snake' "Python Folding
Plug 'kana/vim-arpeggio' "Key mapping for simultaneously pressed keys
Plug 'kana/vim-textobj-entire' "text objects for entire buffer
Plug 'kana/vim-textobj-user' "text objects for entire buffer
Plug 'lervag/vimtex',{'for':['tex', 'markdown','pandoc']}
Plug 'luochen1990/rainbow' "Per Depth html,xml hl colors
Plug 'machakann/vim-highlightedyank' " Temporary highlight yanked txt
Plug 'majutsushi/tagbar' "TagBar
Plug 'mattn/emmet-vim', {'for':['html','xhtml','jinja','htmldjango','xml','php']} "abbreviation expanding html similar to emmet
Plug 'mattn/vim-lsp-settings' "lsp settings
Plug 'mattn/webapi-vim' , {'for':['html','xhtml','jinja','htmldjango','xml','php']} "emmet plugin for web apis
Plug 'maxbrunsfeld/vim-yankstack' "cycle between prev yanks
Plug 'mboughaba/i3config.vim'
Plug 'michaeljsmith/vim-indent-object' "indent text objects"
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ncm2/float-preview.nvim'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
Plug 'ncm2/ncm2-neosnippet'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-rst-subscope'
Plug 'ncm2/ncm2-snipmate'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'filipekiss/ncm2-look.vim'
Plug 'fgrsnau/ncm-otherbuf'
Plug 'fgrsnau/ncm2-aspell'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'neomake/neomake'
Plug 'dkarter/bullets.vim' " Markdown  Bullets list
Plug 'sheerun/vim-polyglot'                             " many languages support
Plug 'tpope/vim-liquid'                                 " liquid language support
Plug 'pbrisbin/vim-mkdir'
Plug 'pearofducks/ansible-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'racer-rust/vim-racer',{'for':'rust'}
Plug 'rstacruz/sparkup', {'rtp': '~/.vim/'}
Plug 'rust-lang/rust.vim', {'for':'rust'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'slashmili/alchemist.vim',{'for':'elixir'}
Plug 'tell-k/vim-autopep8',{'for':'python'}
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-smooth-scroll'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'tomtom/tlib_vim'
Plug 'tounaishouta/coq.vim', {'for':'coq'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/braceless.vim', {'for': ['python']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-pandoc/vim-pandoc',{'for':['pandoc', 'markdown']}
Plug 'vim-pandoc/vim-pandoc-syntax',{'for':['pandoc', 'markdown']}
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'vim-ruby/vim-ruby',{'for':'ruby'}
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'wellle/tmux-complete.vim'
Plug 'wlemuel/vim-tldr'
Plug 'xavierd/clang_complete'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'yegappan/mru' "most recently used


if has('nvim')
    Plug 'davidhalter/jedi-vim'
    Plug 'roxma/nvim-yarp'
    " Plug 'zxqfl/tabnine-vim'
else
    " Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'davidhalter/jedi-vim'
    if uname=='Android'
        " Do Nothing
    else
        " Plug 'zxqfl/tabnine-vim'
    endif
endif
if has('win32') || has('win64')
    " Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
    if uname=='Android'
        " Do Nothing
    else
        Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    endif
endif

call plug#end()

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" BEGIN CONFIGURATIONS HERE
"
" Load my custom functions and keymappings
" source ~/.vim/autoload/load_customs.vim
" GENERAL CONGIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Internal Configurations
set undofile
set hidden
set mouse-=a
set writebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set undodir=~/.vim/undo "where to save undo histories"
set undolevels=1000 "How many Undos"
set undoreload=10000 "number of lines to save for undo"
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set wildignore+=*_build/*
set wildignore+=*.pyc,*.so,*.swp,*.zip,*.un~,.*.*~,*.o,*.obj
set wildignore+=*/coverage/*
set viminfo='20,<1000
set history=2000
" set breakindent  " preserve horizontal whitespace when wrapping
" set showbreak=..
set lbr  " wrap words
set nowrap  " i turn on wrap manually when needed

set pumheight=5
set emoji

set scrolloff=3 " keep three lines between the cursor and the edge of the screen
set splitright  " i prefer splitting right and below
set splitbelow

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" autoreloading of the vimrc file.
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepre hosts setl filetype=cfg
autocmd! bufread hosts setl filetype=cfg
autocmd! bufread config setl filetype=cfg
" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
set autoindent
if has('nvim')
    " set clipboard+=unnamed
    set clipboard+=unnamedplus
else
    set clipboard+=unnamed
endif
" set cursorline
set modelines=2
" set wrap
set linebreak
set showcmd
set showmode
set visualbell

" easier better ident in visual
vnoremap < <gv
vnoremap > >gv
" map sort fx to a key
nmap ` <S-;>
vnoremap ; :
vnoremap : ;
vnoremap <leader>s :sort <CR>
set ruler
set undofile
set ignorecase
set smartcase
au FocusLost,WinLeave * :silent! wa
au FocusGained,BufEnter * :silent! !
set title

set showmatch
set hlsearch
set incsearch
set t_Co=256
set sidescroll=5
set ttyfast
set wildmode=list:longest,full
set ttimeoutlen=50
set noswapfile
" Set identation to 4 spaces
set noai ts=4 sw=4 expandtab
" Set an 80 char column
set textwidth=80
set wrapmargin=80
" read and write changes automatically
set autoread
set autowrite
set colorcolumn=81
" Line numbers
set number relativenumber
" Rule for Makefiles to use tab
autocmd BufEnter ?akefile* set noet ts=4 sw=4
" Syntax highlighting
syntax on
autocmd! BufNewFile,BufRead *.ipy set filetype=python
autocmd! BufNewFile,BufRead *.pyx set filetype=python
autocmd! BufWritePre *.py execute ':Black'
autocmd! BufNewFile,BufRead SConstruct set filetype=python
autocmd! BufNewFile,BufRead *.py,*.pyx,SConstruct UltiSnipsAddFiletypes python
autocmd! BufNewFile,BufReadPost,BufWritePre *.md,*.markdown,*.mkdown,*.mkdn,*.mkd set filetype=vimwiki
autocmd! BufNewFile,BufRead,BufWritePre *.md,*.markdown,*.mkdown,*.mkdn,*.mkd set conceallevel=0
autocmd! BufNewFile,BufRead,BufWritePre *.tex set conceallevel=0
autocmd! BufNewFile,BufRead *.md,*.markdown,*.mkdown,*.mkdn,*.mkd setlocal foldmethod=syntax
autocmd! BufNewFile,BufRead *.md,*.markdown,*.mkdown,*.mkdn,*.mkd UltiSnipsAddFiletypes markdown
autocmd! BufNewFile,BufRead *.yml,*.yaml setlocal ts=2 sw=2
" Color scheme
syntax enable
let g:solarized_termcolors=256
let g:gitgutter_max_signs=4000
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_map_keys = 0

" let g:python3_host_prog='/usr/bin/python'

if emoji#available()
    let g:gitgutter_sign_added = "車"
    let g:gitgutter_sign_modified = "契"
    let g:gitgutter_sign_removed = "襤"
    let g:gitgutter_sign_modified_removed = "雷"
endif

let g:UltiSnipsSnippetsDir="~/.vim/snippets"
let g:UltiSnipsSnippetDirectories=['~/.vim/snippets', '~/.vim/plugged/vim-snippets/UltiSnips', 'UltiSnips' ]
let g:UltiSnipsEditSplit="vertical"
colorscheme delek
let g:solarized_contrast="high"
highlight clear SpellBad
highlight SpellBad cterm=underline,bold ctermbg=none ctermfg=yellow

" Remove trailing spaces on save
autocmd! BufWritePre * :%s/\s\+$//e
" Git commits
autocmd! Filetype gitcommit setlocal spell textwidth=80
set pastetoggle=<M-v>
" Disable folding. It's really annoying and I never remeber the commands.
set laststatus=2
set smartindent


" Fuzzy File Finder
set path+=**
set wildmenu

"" Better navigation through omnicomplete option list
set completeopt=menuone,noselect,menu

au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone,menu

function! OmniPopup(action)
    if pumvisible()
        if a:action=='j'
            return "\<C-n\>"
        elseif a:action =='k'
            return "\<C-p\>"
        endif
    endif
    return a:action
endfunction


set nofoldenable


" Spell Check
" Function to rotate the spell language that is used
let b:myLang=0
let g:myLangList=["nospell", "pt_br", "en_us", "ke_sw"]
function! ToggleSpell()
    let b:myLang=b:myLang+1
    if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
    if b:myLang==0
        setlocal nospell
    else
        execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    endif
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction
" Pressing \ss will toggle and untoggle spell checking
" ]s and [s to move down-up marked words
" Spelling always on for some files
autocmd! BufNewFile,BufRead *.ipy,*.py,*.md,*.tex,*.rst,*.c,*.h,Makefile setlocal nospell

autocmd! BufRead *.rst,*.md,*.tex,*.bib,*.markdown,*.txt setlocal complete+=kspell

" Run 'make' on save
autocmd BufWritePost Makefile* silent! execute "!make >/dev/null 2>&1" | redraw! | echo "Done: make finished."


" PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-indent-guides conf
let g:indent_guides_enable_on_vim_startup=1


" jedi options
let g:jedi#force_py_version=3
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" Vim-SCala Conf
let g:scala_scaladoc_indent = 1
"Linting with neomake
let g:neomake_sbt_maker = {
      \ 'exe': 'sbt',
      \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
      \ 'append_file': 0,
      \ 'auto_enabled': 1,
      \ 'output_stream': 'stdout',
      \ 'errorformat':
          \ '%E[%trror]\ %f:%l:\ %m,' .
            \ '%-Z[error]\ %p^,' .
            \ '%-C%.%#,' .
            \ '%-G%.%#'
     \ }

let g:neomake_enabled_makers = ['sbt', 'make', 'cmake', 'qmake', 'python']
let g:neomake_verbose=3
" Neomake on text change
autocmd! BufWritePost *.scala update | Neomake! sbt

"yankstack config
call yankstack#setup()
let g:yankstack_yank_keys = ['y', 'd']




"
" vim-Markdown customizations
" use python folding style for markdown.
let g:vim_markdown_folding_style_pythonic=1
let g:vim_markdown_follow_anchor=1
" Turn on latex math syntax
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_json_frontmatter=1
let g:vim_markdown_strikethrough=1
let g:vim_markdown_no_extensions_in_markdown=0
let g:vim_markdown_autowrite=1
let g:vim_markdown_edit_url_in="hsplit"
let g:vim_markdown_new_list_item_indent=1


" Nerdcommenter
filetype plugin indent on
" NerdTree
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = [
\ '\.vim$',
\ '\~$',
\ '.git',
\ '.cache',
\ '.local',
\ '_site',
\]
autocmd! Filetype nerdtree setlocal relativenumber number
autocmd! WinEnter __Tagbar__* setlocal relativenumber number
autocmd! WinLeave __Tagbar__* setlocal relativenumber number
autocmd! WinNew __Tagbar__* setlocal relativenumber number
autocmd! StdinReadPre * let s:std_in=1
autocmd! VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif
let g:tagbar_width=27


"
" AIRLINE POWERLINE STATUSLINE
let g:airline_detect_modified=1
let g:airline_theme='papercolor'
" let g:airline_statusline_on_top=1
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1
" let g:airline_left_sep = ' '
" let g:airline_right_sep = '|'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#languageclient#enabled = 1
let g:airline#extensions#promptline#enabled = 1
let g:airline#extensions#default#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#unicode#enabled = 1
let g:airline#extensions#fugitive#enabled = 1
let g:airline#extensions#branch#enabled = 1
" set statusline+=%{FugitiveStatusline()}




" BRACELESS.VIM
" autocmd filetype python :BracelessEnable +indent +highlight
" autocmd BufRead,BufNewFile *.py :BracelessEnable +indent +highlight


" SYNTASTIC SETTING
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rst_checkers = ['text/language_check']
let g:syntastic_tex_checkers = ["lacheck"]
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pydocstyle']




"JS SYNTAX FOLDING
augroup javascript_folding
    au!
    au filetype javascript setlocal foldmethod=syntax
augroup END
let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_null = "ø"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "⇚"
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_NaN = "N"
let g:javascript_conceal_prototype = "¶"
let g:javascript_conceal_static = "•"
let g:javascript_conceal_super = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_noarg_arrow_function = "⇒"
let g:javascript_conceal_underscore_arrow_function = "⇒"
" set conceallevel =1


" VIMTEX CONFIG FOR TEX FILES
" VIMTEX
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer= 'zathura'
let g:vimtex_view_general_options= '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options= '-reuse-instance'
let g:matchup_matchparens_deferred=1
let g:matchup_override_vimtex = 1
let g:vimtex_fold_enabled =0
let g:vimtex_enabled=1
let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1
" let g:vimtex_compiler_progname='nvr'


" FILENAMES LIKE *.XML, *.HTML, *.XHTML, ...
" " These are the file extensions where this plugin is enabled.
" "
" " This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,.*.xml,*.jsx,*.md,*.markdown'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.xml'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,xml,markdown,vimwiki'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,xml'
let g:closetag_emptyTags_caseSensitive = 1
" " Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" " Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
" au FileType xml,html,xhtml,jinja,phtml,jsx,markdown,pandoc,vimwiki setlocal matchpairs+=<:>

au FileType lisp setlocal matchpairs-=':'

" Autopep8 conf
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1


" Vim-overe conf
let g:over_enable_auto_nohlsearch=1
let g:over_enable_cmd_window=1
let g:over_command_line_prompt=">"



" " Ultisnips Config
let g:UltiSnipsExpandTrigger		= "<C-space>"
let g:UltiSnipsJumpForwardTrigger='<C-n>'
let g:UltiSnipsJumpBackwardTrigger='<C-p>'
" let g:UltiSnipsRemoveSelectModeMappings = 0


command! MakeTags !ctags -R -a *.*
command! MakePyScope !find . -type f -name "*.py" |cscope -b -q -i - <CR>
command! MakeCScope !cscope -b -d <CR>
" autocmd! bufwritepost *.c *.cpp *.hpp *.h *.rs *.py  MakeTags


" Markdown Composer options
" Do not attempt to open the browser automatically i'll do it manually
let g:markdown_composer_autostart=0

let g:markdown_composer_browser="chromium"

let g:markdown_composer_external_renderer='pandoc -t html -f markdown '


" Latex Live Preview conf
autocmd Filetype tex setl updatetime=5
let g:livepreview_previewer='zathura'
let g:livepreview_use_biber = 1
let g:livepreview_cursorhold_recompile = 1

" Neosnippets
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
imap <c-c> <ESC>

" Do not hijack the Enter key


let ncm2#popup_delay=5
let ncm2#complete_length=[[1, 1]]
let g:ncm2#matcher='substrfuzzy'

au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#delay', 180,  'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })

" Clang Stuff
let g:clang_complete_auto=0
let g:clang_restore_cr_imap='inoremap <buffer> <CR> <cr>'
let g:clang_close_preview=1
let g:clang_snippets_engine="ultisnips"
let g:clang_complete_macros=0
let g:clang_debug=1
let g:clang_library_path='/usr/lib/'
let g:clang_user_options='|| exit 0'
let g:clang_snippets=1
let g:clang_use_library=1
let g:clang_auto_select=0
let g:clang_complete_optional_args_in_snippets=0

" Rust Config
let g:rustfmt_autosave=1
let g:racer_insert_paren=1
let g:racer_experimental_completer=1


" EMMET CONFIG
" Note that the trailing , still needs to be entered, so the new keymap would be <Tab>,.
"you can also add your own snippets using a custom snippets.json file.
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
"
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings={
            \'php':{'extends':'html','filters':'c'},
            \'xml':{'extends':'html'},
            \'jinja':{'extends':'xml'},
            \'jinja.html':{'extends':'xml'},
            \'haml':{'extends':'html'},
            \'htmldjango':{'extends':'html'},
                \}
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,xml,xhtml,php,mhtml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" RAINBOW PARENTHESES
let g:rainbow_active=1


" FUZZYFIILE CONF
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'escape': 'quit',
  \ 'ctrl-v': 'vsplit' }
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R %'

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

"Zeal Documentation Browser Config
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZeavimV
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>[ :NERDTreeToggle<CR>


" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=vin
endif

let g:multi_cursor_quit_key='<esc>'
let g:raku_unicode_abbrevs=1

function! Prettify()
    execute "%!python -m json.tool" | w
endfunction

autocmd! BufWritePost *.json call Prettify()

function! s:try_insert(skel)
    execute "normal! i" . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
    if g:ulti_expand_res == 0
        silent! undo
    endif

    return g:ulti_expand_res
endfunction

function! InsertSkeleton() abort
    " Abort non-empty buffer or extant file
    if !exists('g:did_UltiSnips_plugin') || !(line('$')) == 1 && getline('$') == ''
        return
    endif

    call s:try_insert("tdc")
endfunction

command! InsPydoc call s:try_insert("tdc")
nnoremap <leader>3 :InsPydoc <cr>

function! Try_insert(skel)
    execute "normal! i" . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
    if g:ulti_expand_res == 0
        silent! undo
    endif

    return g:ulti_expand_res
endfunction
" All my keymaps go here
" Taking a modularized approach
" Quickly Edit My VIMRC
" VIM8
nnoremap <leader>v :tabedit ~/.vimrc <CR>

"Neovim
nnoremap <leader>sv :tabedit $MYVIMRC <CR>

" Git shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ga :G add %<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gw :Gwrite<CR>


" Tabularize shortcuts
noremap <leader>a= :Tabularize /=<CR>
noremap <leader>a: :Tabularize /:<CR>
noremap <leader>a:: :Tabularize /:\zs<CR>
noremap <leader>a, :Tabularize /,<CR>
noremap <leader>a<Bar> :Tabularize /<Bar><CR>
" Enforcing Purity
noremap <Up> <tabcloseNop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nmap <leader>1 :!chmod +x % <CR>
nmap <leader>4 :source ~/.vimrc <CR>
nnoremap <leader>1 :!chmod +x % <CR>
nnoremap <leader>4 :source ~/.vimrc <CR>

" Improve regex handling
" nmap / /\v
" zoom a vim pane, <C-w>= to rebalance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
nnoremap <leader><space> :noh<cr>
" Map F2 to paste mode so that pasting in the terminal doesn't mess identation
nnoremap <F12> :set invpaste paste?<CR>
"Ommit the <C-W> when moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Window switching keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Vim Sneak
map s <Plug>Sneak_s
map S <Plug>Sneak_S

" Paste Line with Y
nmap Y y$
"yankstack config
map <leader>a <Plug>yankstack_substitute_older_paste
nmap <leader>c <Plug>yankstack_substitute_newer_paste

" easier better ident in visual
vnoremap < <gv
vnoremap > >gv
" map sort fx to a key

vnoremap <leader>s :sort <CR>
map <leader>ss :call ToggleSpell()<cr>
"easier movement between tabs
map <leader>t <esc>:tabnew<CR>
map <leader>f :MRU<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
map <leader>w :w!<CR>
map <s-space> /\v
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
map <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>t <esc>:tabnew<CR>
nnoremap <leader>x <esc>:bd<CR>
nnoremap <leader>tx <esc>:tabclose<CR>
nnoremap <leader>f :MRU<CR>
nnoremap <leader>e :NERDTreeFind<CR>
nnoremap <s-space> /\v
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
nnoremap <leader>cwd :cd %:p:h<CR>:pwd<CR>
nnoremap ; :
nnoremap : ;

au Filetype markdown map <leader>[ :HeaderDecrease <cr>
au Filetype markdown map <leader>] :HeaderIncrease <cr>
au Filetype markdown map <leader>/ :TableFormat <cr>
au Filetype markdown set textwidth=80
nnoremap <leader>we :tabe ~/Documents/notes/index.md <cr>
"Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"
au FileType c,cpp inoremap <buffer> <silent> <CR> <CR>

au FileType rust nmap gx <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gd <Plug>(rust-def-vertical)
au FileType rust nmap gt <Plug>(rust-def-tab)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

nnoremap <leader><tab> :tabnext <CR>
nnoremap <leader>` :tabprevious <CR>



if has('nvim')
    " Neovim Terminal Mappings
    tnoremap <ESC> <C-\><C-n>
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    inoremap <C-h> <C-\><C-N><C-w>h
    inoremap <C-j> <C-\><C-N><C-w>j
    inoremap <C-k> <C-\><C-N><C-w>k
    inoremap <C-l> <C-\><C-N><C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    "To simulate |i_CTRL-R| in terminal-mode:
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    packadd termdebug
    set pumblend=15
    set shada='20,<50,s10,h
endif


autocmd! BufWritePost ~/.Xresources,~/.Xdefaults  !xrdb %


command! -nargs=* -complete=shellcmd R tabe | setlocal buftype=nofile bufhidden=hide noswapfile | 0r !<args>
command! -nargs=* -complete=shellcmd Rc 1,$d | 0r !<args>

nnoremap <leader>rr :R
nnoremap <leader>rc :Rc

function! GenWikiIndex()
    let files=split(system("ls *.md"),"\n")
    normal! gg
    normal! dG
    for i in files
        let lna= "[".i."](".i.")"
        let @l=lna
        normal! gg
        execute "put l"
    endfor
    silent! execute "1,$ g/^$/d"
endfunction

function! GenImgIndex()
    let files=split(system("ls *.png"),"\n")
    normal! G
    for i in files
        let lna= "![".i."](".i.")"
        let @l=lna
        normal! gg
        execute "put l"
    endfor
endfunction
" Always jump to the last known cursor position.
" Don't do ot when position is invalid or when inside an
" event handler (happens when dropping a file on gvim)
autocmd! BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


function! Line2Link()
    normal yss]
    normal yi[
    normal f]
    normal p
    normal $
    normal F]
    normal l
    normal ys$)
    normal 0
endfunction

command! Line2Link call Line2Link()
command! GenImgIndex call GenImgIndex()
command! GenWikiIndex call GenWikiIndex()

au Filetype markdown,vimwiki,pandoc  set textwidth=80

nnoremap <leader>\l :Line2Link <CR>
nnoremap <leader>wx :GenWikiIndex <CR>
nnoremap <leader>ix :GenImgIndex <CR>

function! Fzf_dev()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor

    return result
  endfunction

  function! s:edit_file(item)
    let parts = split(a:item, ' ')
    let file_path = get(parts, 1, '')
    execute 'silent e' file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m -x +s',
        \ 'down':    '40%' })
endfunction


command! FilesWithIcon :call Fzf_dev()
nnoremap <C-f> :FuzzyOpen <CR>

" AutoPairs Conf
au BufRead *.asd,.emacs,.spacemacs,*.lisp,.sbclrc,.clisprc  set ft=lisp
au FileType html,xml,xhtml,php,jinja silent! let b:AutoPairs=AutoPairsDefine({"<!--":"--!>",'{%':'%}','{%#':'#%}','<?':'?>','<?php':'?>'},["<"])
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
au! FileType  lisp silent! let b:AutoPairs=AutoPairsDefine({';':' '},["'","`"]) " remove ' for lisp files


let g:vlime_window_settings = {
        \ "repl": {
            \ "pos": "botright",
            \ "vertical": v:true
        \ },
        \ "server":{
            \ "pos": "botright",
            \ "size": 5,
            \ "vertical": v:true
        \},
        \ "sldb": {
            \ "pos": "topleft",
            \ "vertical": v:true,
            \ "size": v:null
        \ }
    \ }

let g:vlime_cl_use_terminal=v:false
let g:vlime_enable_autodoc=v:true
let g:vlime_autodoc_max_lines=10

au FileType vlime_server,vlime_notes silent! resize 5
au BufEnter,BufLeave vlime_server silent! resize 5
au BufEnter,BufLeave vlime_notes silent! resize 5
au BufLeave vlime_preview silent! bd

au FileType lisp silent! syntax keyword lispFunc lambda conceal cchar=λ
au FileType lisp silent! syntax keyword lispFunc sqrt conceal cchar=√
au FileType lisp silent! syntax keyword lispFunc every conceal cchar=∀
au FileType lisp silent! syntax keyword lispFunc some conceal cchar=∃
au FileType lisp silent! syntax keyword lispFunc or conceal cchar=∨
au FileType lisp silent! syntax keyword lispFunc and conceal cchar=∧
au FileType lisp silent! syntax keyword lispFunc "/" conceal cchar=÷
au FileType lisp silent! syntax keyword lispFunc not  conceal cchar=¬
au FileType lisp silent! syntax keyword lispSymbol nil conceal cchar=∅
au FileType lisp silent! syntax keyword lispSymbol pi conceal cchar=π
au FileType lisp silent! set conceallevel=2

au FileType python silent! syntax match pyNiceStatement int conceal cchar=ℤ
au FileType python silent! syntax match pyNiceStatement float conceal cchar=R
au FileType python silent! syntax match pyNiceStatement complex conceal cchar=ℂ

au FileType cmake silent syntax on
au FileType vimwiki silent set conceallevel=0
au FileType markdown silent set conceallevel=0
au FileType pandoc silent set conceallevel=0
