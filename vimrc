""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plugin Installation                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Syntax Files                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'danro/rename.vim'
Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jlanzarotta/bufexplorer'
Plug 'godlygeek/csapprox'
Plug 'christoomey/vim-tmux-navigator'

""""""""""""""""""
"  syntax files  "
""""""""""""""""""
Plug 'keith/tmux.vim'
Plug 'rust-lang/rust.vim'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set visualbell t_vb=
set novisualbell
if has("belloff")
  set belloff=all
endif

""""""""""""
"  Colors  "
""""""""""""
let base16colorspace=256  " Access colors present in 256 colorspace

" if has("termguicolors") && !has("gui_running")
"   set termguicolors
" endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if has("gui_running")
    set guioptions=c
    colorscheme professional
    syntax off
else
    colorscheme professional
    syntax off
endif

""""""""""
"  Font  "
""""""""""
if has("gui_running")
  if has("macunix")
    set guifont=ProFontWindows:h13
  elseif has("unix")
    set guifont=Courier\ Screenplay\ 11
  endif
endif


""""""""""""""""""""""""""
"  Indentation Settings  "
""""""""""""""""""""""""""
set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
set expandtab
set nosmartindent
set noautoindent    " turn off indent
set nocopyindent    " turn off indent
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop

" Facebook indent style; override these explicitly to turn them off.
set shiftwidth=2    " two spaces per indent
set tabstop=2       " number of spaces per tab in display
set softtabstop=2   " number of spaces per tab when inserting
set expandtab       " substitute spaces for tabs


set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·


""""""""""
"  size  "
""""""""""
if has("gui_running")
  set lines=35
  set columns=87
endif


"""""""""""""""""
"  colorcolumn  "
"""""""""""""""""
" set colorcolumn=80

"""""""""""""""""""""
"  Search settings  "
"""""""""""""""""""""
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
noremap <Space>/ :nohlsearch<CR>

"""""""""""""""""""
"  Wrap settings  "
"""""""""""""""""""
set tw=80
set formatoptions+=t

"""""""""""""""""""
"  Easier leader  "
"""""""""""""""""""
" nmap <Space> <leader>


""""""""""""""
"  No folds  "
""""""""""""""
set nofoldenable

"""""""""""""""""
"  status line  "
"""""""""""""""""
set statusline=
set statusline+=\[#%n]                                 "buffernr
set statusline+=\ %<%F\                                "File+path
set statusline+=\ %y\                                  "FileType
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=\ col:%03c\                            "Colnr
set statusline+=\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

set laststatus=2

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Moving Around Windows                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-Down> <C-w>w
nnoremap <C-Up> <C-w>W

"""""""""""""""""""""""
"  Buffer Navigation  "
"""""""""""""""""""""""
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Convenience Mappings                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Plugin Mappings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""
"  macvim-specific `hack`  "
""""""""""""""""""""""""""""
if has("macunix")
  map ƒ <M-f>
  map! ƒ <M-f>

  map π <M-p>
  map! π <M-p>

  map ∫ <M-b>
  map! ∫ <M-b>
end

""""""""""""""""""""""
"  General Mappings  "
""""""""""""""""""""""
inoremap jk <Esc>
noremap Q :q<CR>
noremap gQ :q!<CR>
nmap <silent> <leader>ev :vsp $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap z<Space> za

"""""""""""""""""""
"  Easier splits  "
"""""""""""""""""""
nnoremap <expr><silent> \| !v:count ? "<C-W>v<C-W><Right>" : '\|'
nnoremap <expr><silent> _  !v:count ? "<C-W>s<C-W><Down>"  : '_' 


"""""""""""""""""""""""""""""""""""""""""""""
"  Better command line (readline mappings)  "
"""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

"""""""""""""""""""""
"  Plugin Mappings  "
"""""""""""""""""""""

"""""""""""""""
"  Ultisnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"""""""""""""""
"  EasyAlign  "
"""""""""""""""
xmap ga <Plug>(EasyAlign)

""""""""""""""""""""
"  Tmux Navigator  "
""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <Down> :TmuxNavigateDown<cr>
nnoremap <silent> <Up> :TmuxNavigateUp<cr>
nnoremap <silent> <Right> :TmuxNavigateRight<cr>


"""""""""
"  FZF  "
"""""""""
nnoremap <silent> <C-p> :FZF<cr>

"""""""""""""""
"  FZFBUFFER  "
"""""""""""""""
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <SID>FZFBuffer :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

nmap <silent> <C-b> <SID>FZFBuffer
nmap <silent> <space><space> <SID>FZFBuffer

""""""""""""
"  FZFMRU  "
""""""""""""
command! FZFMru call fzf#run({
            \'source': v:oldfiles,
            \'sink' : 'e ',
            \'options' : '+m',
            \   'down':   '33%'
            \})

nnoremap <silent> <C-f> :FZFMru<cr>


map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

