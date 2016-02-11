""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plugin Installation                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"""""""""""""
"  Plugins  "
"""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'itchyny/lightline.vim'
Plug 'd11wtq/tomorrow-theme-vim'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'dbakker/vim-lint'
Plug 'ntpeters/vim-better-whitespace'
Plug 'danro/rename.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/vim-easy-align'
Plug 'thinca/vim-visualstar'
Plug 'dag/vim2hs'
Plug 'tpope/vim-vividchalk'
Plug 'dogrover/vim-pentadactyl'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Konfekt/FastFold'
Plug 'JuliaLang/julia-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-dispatch'
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'freeo/vim-kalisi'
Plug 'mbbill/desertEx'
Plug 'RyanMcG/vim-j'
" Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
" Plug 'legendre6891/yalp'
" Plug '~/yalp'
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set visualbell t_vb=

""""""""""""
"  Colors  "
""""""""""""
let base16colorspace=256  " Access colors present in 256 colorspace
syn on
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if has("gui_running")
    set bg=dark
    set guioptions=c
    let g:hybrid_custom_term_colors = 1
    colorscheme hybrid
else
    set bg=dark
    colorscheme hybrid
endif

""""""""""
"  Font  "
""""""""""
if has("gui_running")
  set guifont=PragmataPro:h14
endif

""""""""""""""""""""""""""
"  Indentation Settings  "
""""""""""""""""""""""""""
set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
set expandtab
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
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

"""""""""""""""""""
"  Wrap settings  "
"""""""""""""""""""
set tw=80
set formatoptions+=t

"""""""""""""""""""
"  Easier leader  "
"""""""""""""""""""
nmap <Space> <leader>


""""""""""""""
"  No folds  "
""""""""""""""
set nofoldenable

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

""""""""""""""
"  Undotree  "
""""""""""""""
nnoremap <F5> :UndotreeToggle<cr>

""""""""""""
"  Ctrl-P  "
""""""""""""
" nnoremap <C-t> :CtrlPBuffer<cr>
" nnoremap <Space>p :CtrlP<cr>
" nnoremap <Space>r :CtrlPMRUFiles<cr>
" nnoremap <Space>t :CtrlPBuffer<cr>
" nnoremap <Space>b :CtrlPBuffer<cr>

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


"""""""""""""""
"  Lightline  "
"""""""""""""""
set laststatus=2
if has("gui_running")
  let g:lightline = {'colorscheme': 'jellybeans'}
else
  let g:lightline = {'colorscheme': 'jellybeans'}
endif

"""""""""""""""
"  Ultisnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

""""""""""""""""
"  Easy-align  "
""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)


""""""""""""""
"  FastFold  "
""""""""""""""
set foldmethod=manual
let g:tex_fold_enabled=0

""""""""""""""""""
"  LaTeX/AucTeX  "
""""""""""""""""""

"""" I got rid of auto-pairs
" let g:tex_flavor="latex"
" augroup filetype_tex
"     autocmd!
"     autocmd FileType tex :let b:AutoPairs = g:AutoPairs
"     autocmd FileType tex :call extend(b:AutoPairs, {"$":"$"})
" augroup END

"""""""""""""""
"  Vim-Sneak  "
"""""""""""""""
let g:sneak#streak = 1

"""""""""""""""
"  Syntastic  "
"""""""""""""""
let g:syntastic_mode_map = { "mode": "active",
                            \ "active_filetypes": [],
                            \ "passive_filetypes": ["tex", "latex"] }
"""""""""""""""""""
"  incsearch.vim  "
"""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
map N  <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
map *  <Plug>(incsearch-nohl)<Plug>(anzu-star-with-echo)
map #  <Plug>(incsearch-nohl)<Plug>(anzu-sharp-with-echo)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

""""""""""""""
"  anzu.vim  "
""""""""""""""
set statusline=%{anzu#search_status()}

"""""""""""""""
"  vim-slime  "
"""""""""""""""
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

