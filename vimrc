"##############################################################"
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
"
" Vim Configuration
"
" Cody Krivacic
"
" This is the personal Vim configuration of Cody Krivacic.
"
" File: vimrc
"
"##############################################################"

    " General Settings {

        "execute pathogen#infect()
        " We use Vim settings
        set nocompatible        " Must be the first line

        " set the runtime path to include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        " alternatively, pass a path where Vundle should install plugins
        "call vundle#begin('~/some/path/here')

        " let Vundle manage Vundle, required
        Plugin 'VundleVim/Vundle.vim'


        " All of your Plugins must be added before the following line
        " To ignore plugin indent changes, instead use:
        "filetype plugin on

        " Load external settings
        set exrc
        " set secure

        " Disable backup
        set nobackup
        set nowritebackup

        " Set some search options
        "set incsearch
        set ignorecase
        set hlsearch
        " remap space to clear highlight
        nmap <SPACE> <SPACE>:noh<CR>

        " Spell Checking
        set spell spelllang=en_us
        "set nospell
        "set spelllang=en,es,it
        set spellsuggest=5

        " Setup Vundle Support {

            filetype off            " Required by Vundle


        " }

    " }tt

" Plugins {
"
        " The following are examples of different formats supported.
        " Keep Plugin commands between vundle#begin/end.
        " plugin on GitHub repo
        Plugin 'tpope/vim-fugitive'
        " plugin from http://vim-scripts.org/vim/scripts.html
        " Plugin 'L9'
        " Git plugin not hosted on GitHub
        Plugin 'git://git.wincent.com/command-t.git'
        " git repos on your local machine (i.e. when working on your own plugin)
        " The sparkup vim script is in a subdirectory of this repo called vim.
        " Pass the path to set the runtimepath properly.
        Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
        " Install L9 and avoid a Naming conflict if you've already installed a
        " different version somewhere else.
        Plugin 'ascenator/L9', {'name': 'newL9'}
        Plugin 'scrooloose/nerdTree'
        Plugin 'scrooloose/nerdcommenter'
        " surround.vim - simple quotation & bracket management
        Plugin 'tpope/vim-surround'
        
        " COLORS
        " Colors solarized
        Plugin 'altercation/vim-colors-solarized'
        " jellybeans
        Plugin 'nanotech/jellybeans.vim'

        " syntax plugin
        "Plugin 'vim-syntastic/syntastic'
        Plugin 'dense-analysis/ale'

        "c++ tags
        Plugin 'lyuts/vim-rtags'
        let g:rtagsRcCmd = '/home/ckrivacic/apps/rtags/bin/rc'
        
        " Automatically keep tags up to date
        " Plugin 'ludovicchabant/vim-gutentags'
        Plugin 'majutsushi/tagbar'
        nmap <F8> :TagbarToggle<CR>
        
        " Fuzzy searching with Ctrl-P
        Plugin 'kien/ctrlp.vim'

        " Folding
        Plugin 'Konfekt/FastFold'
        Plugin 'kalekundert/vim-coiled-snake' " For Python

        " Completion
        Plugin 'ycm-core/YouCompleteMe'

        " Airline
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        let g:airline_theme='solarized_flood'

        " Github gutters
        Plugin 'mhinz/vim-signify'
"
" }

" Formatting {

    " Set maximum width of text line
     set textwidth=72
     set colorcolumn=200

    " Tabs settings
    set expandtab
    set tabstop=4
    set shiftwidth=4

    " Automatic Indentation
    set autoindent
    set shiftwidth=4
    let g:autoformat_autoindent = 1
    let g:autoformat_retab = 1
    let g:autoformat_remove_trailing_spaces = 1
    autocmd BufWrite * :set fileformat=unix 

    " Splitting
    set splitbelow
    set splitright

" }

" Programming Settings {

    " Set backspace key working properly
    set backspace=indent,eol,start

    " Set folding method and leave all folds open
    set fdm=syntax
    set foldnestmax=10
    set nofoldenable
    set foldlevel=2

    " Enconding text
    set encoding=utf8

    " Syntax
    syntax on

    " Include Library
    let &path.="src/include,/usr/include/AL,"
    set includeexpr=substitute(v:fname,'\\.','/','g')

    " YouCompleteMe

   
   " let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
   function! StartUp()
       if 0 == argc()
           NERDTree
       end
   endfunction

   autocmd VimEnter * call StartUp()


" }

" Vim UI {

    " Color Scheme and Background
    let g:solarized_termcolors=256
    syntax enable
    set background=dark
    colorscheme solarized

    " Statusline
    set laststatus=2
    set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASCII=\%03.3b\ HEX=\%02.2B]\ [POS=%04l,%04v\ %p%%\ %L]

    " Line numbers
    set number
    "highlight LineNr ctermfg=grey

    " Set visual bell
    set vb

    " Disable mouse in a terminal
    set mouse=

" }

" GVim GUI {

    " Set useful settings for GVim in case .gvimrc is missing
    " Note that gvimrc file is always sourced after the vimrc file.
    if has('gui_running')

        " Color Scheme and Background
        syntax enable
        set background=dark
        colorscheme solarized

        " Enable mouse in a windows
        set mouse=a

    endif

" }

" External Configurations {

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ

" }

" Keyboard Remappings {
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " YouCompleteMe bindings
    nnoremap <leader>gu :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gj :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }

" Syntactic configuration {


    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*

    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    "let g:syntastic_check_on_open = 1
    "let g:syntastic_check_on_wq = 0

" }

" ALE configuration {

"let g:ale_completion_enabled = 1
"let g:ale_completion_delay = 0
" let g:ale_rust_cargo_use_check = 1


" }
" Uncomment this if you use GVim in Windows
" Vundle fix to load bundles
"if has('gui_running')
"   call vundle#config#require(g:bundles)
"endif

" End of vimrc
