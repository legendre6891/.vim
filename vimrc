if !has('nvim')
  set guiheadroom=0
endif
" GUI options that should load first
set guioptions-=m
set guioptions-=M
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=t
set guioptions-=T
set guioptions+=c
set guioptions+=i


" Disable highlighting parens
let loaded_matchparen = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plugin Installation                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Syntax Files                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

if has('nvim')
  Plug 'equalsraf/neovim-gui-shim'
endif

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'

Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-gtfo'

Plug 'chrisbra/Colorizer'

Plug 'danro/rename.vim'
Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'christoomey/vim-tmux-navigator'

Plug 'chriskempson/tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'romainl/Apprentice'
Plug 'nielsmadan/harlequin'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'jnurmine/Zenburn'
Plug 'fxn/vim-monochrome'
Plug 'w0ng/vim-hybrid'
Plug 'zanglg/nova.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'twerth/ir_black'
Plug 'cocopon/iceberg.vim'


Plug 'sjl/clam.vim'
Plug 'legendre6891/yalp'

Plug 'kana/vim-textobj-user'
Plug 'zandrmartin/vim-textobj-blanklines'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'

Plug 'romainl/vim-qf'

""""""""""""""""
" Syntax files "
""""""""""""""""
Plug 'nickhutchinson/vim-cmake-syntax'
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
if has("macunix")
  set shell=/usr/local/bin/bash
elseif has("unix")
  set shell=/bin/bash
endif

""""""""""""
"  Colors  "
""""""""""""
let base16colorspace=256  " Access colors present in 256 colorspace


if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if has("termguicolors") && !has("gui_running") && $TMUX  == ""
  set termguicolors
endif


colors ir_black


""""""""""
"  Font  "
""""""""""

" if has("gui_running")
"   if has("macunix")
"     set guifont=PragmataPro:h14
"   elseif has("unix")
"     set guifont=Mononoki\ 12
"   endif
" endif


""""""""""""""""""""""""""
"  Indentation Settings  "
""""""""""""""""""""""""""
set hidden
set nowrap       " don't wrap lines
set tabstop=4    " a tab is four spaces
set backspace=indent,eol,start
set expandtab
set nosmartindent
set noautoindent " turn off indent
set nocopyindent " turn off indent
set number       " always show line numbers
set shiftwidth=4 " number of spaces to use for autoindenting
set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch    " set show matching parenthesis
set ignorecase   " ignore case when searching
set smartcase    " ignore case if search pattern is all lowercase,
                 " case-sensitive otherwise
set smarttab     " insert tabs on the start of a line according to
                 " shiftwidth, not tabstop

set nolist
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·


"""""""""""""""""
"  colorcolumn  "
"""""""""""""""""
" set colorcolumn=80

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

""""""""""""""
" Wildignore "
""""""""""""""
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


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

"""""""""""""""""""""""
"  Buffer Navigation  "
"""""""""""""""""""""""
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Convenience Mappings                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:p:h')).'/' : '%%'
nnoremap H ^
nnoremap L $
onoremap H ^
onoremap L $

let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

function! SetupCR()
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

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
nmap <silent> \ev :vsp $MYVIMRC<CR>
nmap <silent> \sv :so $MYVIMRC<CR>

nnoremap <silent> <space><space> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>


"""""""""""""""""""
"  Easier splits  "
"""""""""""""""""""
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> -     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"


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
"  EasyAlign  "
"""""""""""""""
xmap ga <Plug>(EasyAlign)


"""""""""
"  FZF  "
"""""""""
nnoremap <silent> <C-p> :FZF<cr>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



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


"""""""""""""
"  VIMFILER  "
"""""""""""""
" if has("python3")
"   nnoremap - :VimFilerExplorer<CR>
" endif



"""" COMMAND-t
let g:CommandTFileScanner="watchman"


"""""""""""""""
"  vim-slash  "
"""""""""""""""
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif


""""""""""
"  GTFO  "
""""""""""
let g:gtfo#terminals = { 'mac' : 'iterm', 'unix': 'urxvt -cd' }


"""""""""""
"  LATEX  "
"""""""""""
let g:tex_flavor="latex"

let g:ulti_expand_res = 0 "default value, just set once
function! Ulti_Expand()
  call UltiSnips#ExpandSnippetOrJump()
  return g:ulti_expand_or_jump_res
endfunction

function! SendBackspace()
  call feedkeys("\<BS>")
  call feedkeys("\<Plug>JumpJump")
endfunction


augroup vimrc
  autocmd!
  au FileType tex inoremap <buffer> <Tab> <C-R>=(Ulti_Expand() > 0) ? "" : SendBackspace()<CR>
augroup END


augroup yalp
  autocmd!
  autocmd BufNewFile,BufRead *.tex setlocal indentexpr&
augroup END

"""" Spelling
nnoremap sn ]s
nnoremap sp [s
nnoremap ss 1z=


"""""""""""""""""""""
" Interesting-Words "
"""""""""""""""""""""
let g:interestingWordsDefaultMappings = 0
nnoremap <silent> cok :call InterestingWords('n')<cr>
nnoremap <silent> coK :call UncolorAllWords()<cr>

" set shell=/bin/bash
