""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plugin Installation                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

"""""""""""""
"  Plugins  "
"""""""""""""
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'danro/rename.vim'
Plug 'thinca/vim-visualstar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set visualbell t_vb=
set novisualbell
set belloff=all

""""""""""""
"  Colors  "
""""""""""""
let base16colorspace=256  " Access colors present in 256 colorspace
syn on

if has("termguicolors") && !has("gui_running")
  set termguicolors
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if has("gui_running")
    set bg=light
    set guioptions=c
    let g:hybrid_custom_term_colors = 1
    colorscheme default
endif

""""""""""
"  Font  "
""""""""""
if has("gui_running")
  set guifont=Courier\ Screenplay:h14
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


"""""""""""""""""
"  colorcolumn  "
"""""""""""""""""
set colorcolumn=80

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
set statusline+=\[#%n]                                  "buffernr
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
nnoremap ss :sp<cr>
nnoremap sv :vsp<cr>


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

let g:fzf_action = {
  \ 'ctrl-m': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'alt-j':  'botright split',
  \ 'alt-k':  'topleft split',
  \ 'alt-h':  'vertical topleft split',
  \ 'alt-l':  'vertical botright split' }



"""""""""""""""
"  EasyAlign  "
"""""""""""""""
xmap ga <Plug>(EasyAlign)

