filetype off                  " required
set nocompatible              " be iMproved, required

if has('win32')
    let $DOTVIM='$USERPROFILE/vimfiles/'
else
    let $DOTVIM='~/.vim/'
endif

" open syntax highlighting
syntax on
filetype plugin on    " required
filetype indent on 

" set the runtime path to include Vundle and initialize
set rtp+=$DOTVIM/bundle/Vundle.vim/ 
call vundle#begin('$DOTVIM/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'TxtBrowser'
Plugin 'taglist.vim'
Plugin 'mattn/webapi-vim'
Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neco-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'vim-latex/vim-latex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mattn/emmet-vim'
Plugin '907th/vim-auto-save'
Plugin 'airblade/vim-gitgutter'  
Plugin 'chase/focuspoint-vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rdolgushin/gitignore.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'


" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" vim markdown 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" enable powershell syntax plug
autocmd BufNewFile,BufReadPost *.ps1 set filetype=ps1

" nerd tree
" autostart nerdtree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim when there is only nerdtree windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" nerdtree show hidden file
let NERDTreeShowHidden=1

" nerdtree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "-",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : "%",
    \ "Clean"     : "~",
    \ "Unknown"   : "?"
    \ }

"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<Right>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" set auto save event 
let g:auto_save_events = ["TextChanged"] 
let g:auto_save_silent = 1  " do not display the auto-save notification

" neocomplete use tab instead of enter
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
"" enable neocomplcache at startup
"let g:neocomplcache_enable_at_startup = 1
"" set neocomplcache source list
"if !exists('g:neocomplcache_sources_list')
  "let g:neocomplcache_sources_list = {}
"endif
""let g:neocomplcache_disabled_sources_list.tex =
""\ ['dictionary_complete']
" Enable neocomplete at startup
let g:neocomplete#enable_at_startup = 1
" Use smartcase
let g:neocomplete#enable_smart_case = 1
" set neocomplete source
if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer', 'dictionary', 'file', 'neosnippet']
let g:neocomplete#sources.ps1 = ['buffer', 'dictionary', 'file', 'neosnippet']
let g:neocomplete#sources.tex = ['dictionary', 'file', 'omni', 'neosnippet']
let g:neocomplete#sources.vim = ['buffer', 'vim', 'file', 'neosnippet']

" enable airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" empty the defaults to use unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

"" the latex-box auto compile
"let g:LatexBox_latexmk_preview_continuously=1 
"let g:LatexBox_latexmk_async=1
"let g:LatexBox_quickfix=2

"" setting pdf viewer for vimtex
"let g:vimtex_view_general_viewer = 'SumatraPDF'
"let g:vimtex_view_general_options
    "\ = '-reuse-instance -forward-search @tex @line @pdf'
"let g:vimtex_view_general_options_latexmk = '-reuse-instance'"  
"" enable vimtex 
"" Load Vimtex
"let &rtp  = '~/.vim/bundle/vimtex,' . &rtp
"let &rtp .= ',~/.vim/bundle/vimtex/after'

" vim latex settings
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nh\ $*
" optional: starting with vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" the following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" set compile rule 
let g:tex_compilerule_dvi = 'latexmk $*'
" disable GoToSelectMode to avoid coping <++>
let g:Imap_GoToSelectMode = 0 
" set new macro for figure
let g:Tex_Env_figure = '\begin{figure}[<+htpb+>]<CR>    \centering<CR>     \includegraphics[height=<+height+>]{<+image path+>}<CR>    \caption{<+caption text+>}<CR>    \label{fig:<+label+>}<CR>\end{figure}<++>'


" set viewer for vimlatex preview
let g:livepreview_previewer = 'sumatrapdf.exe'

" vim r location
let g:vimrplugin_r_path="C:\\Program Files\\R\\R-3.2.3\\bin\\x64"

" set dictionary
let TxtBrowser_Dict_Url='http://cn.bing.com/dict/search?q=text'
" set search engine
let TxtBrowser_Search_Engine='http://global.bing.com/search?q=test'

" set previm realtime preview
let g:previm_enable_realtime=1

" navigate split windows with alt+arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" use ctrl+c ctrl+v to do copy and paste
imap <C-v> <S-Insert>
vmap <C-c> y

" use ctrl-z to undo
imap <C-z> <Esc>ui

" use ctrl-; to correct spell in insert mode
imap <C-;> <Esc>[s1z=`]a

" color scheme
colorscheme focuspoint 
" font
if has('win32')
    set guifont=Consolas:h10:cANSI
else
    set guifont=Monospace 10
endif    
    
" hide tool bar
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

set backspace=2 " make backspace work like most other apps

" When opening a file remember last cursor position
if has("autocmd")
  augroup restoreCursor
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
  augroup END
endif

"enable 256 colors in ConEmu on Win
if has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif


" automatically refresh plugins
function! RefreshPlugins()
    :write
    :source ~/_vimrc
    :PluginInstall
    :PluginClean
endfunction
command! PluginRefresh call RefreshPlugins()

function! RefreshPluginsWithUpdate()
    :write
    :source ~/_vimrc
    :PluginInstall
    :PluginClean
    :PluginUpdate
endfunction command! PluginRefreshUpdate call RefreshPluginsWithUpdate()

" set utf-8
:set encoding=utf-8
:set fileencoding=utf-8

" use direct-x render
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1


" source the general file
source $DOTVIM/general_vim_config.vim
