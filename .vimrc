call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdcommenter'
Plug 'joshdick/onedark.vim'
Plug 'mileszs/ack.vim'
Plug 'APZelos/blamer.nvim'
call plug#end()

set number " show line number
set laststatus=2
let g:blamer_enabled = 1

set expandtab " tab to space
set tabstop=2 shiftwidth=2
set smarttab
set autoindent
set nowrap
set hidden

set ignorecase
set smartcase

set hlsearch
set incsearch
set mouse=a
set showmatch

syntax enable
set relativenumber
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
set wildmenu
set exrc
let mapleader=","

nnoremap <leader><space> :nohlsearch<CR>
nnoremap B ^
nnoremap E $
inoremap jk <esc>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>f :Files<CR>
nnoremap tn :tabnew<space>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <Leader>w <C-w>
vmap // <plug>NERDCommenterToggle
nmap // <plug>NERDCommenterToggle
noremap <Leader>c "*y
noremap <Leader>v "*p

set foldenable
set ruler
set scrolloff=25

colorscheme onedark

if (has('termguicolors'))
  set termguicolors
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic
set t_Co=256
highlight normal ctermbg=NONE ctermfg=grey
highlight LineNr ctermbg=NONE ctermfg=grey
highlight Pmenu ctermbg=black ctermfg=grey

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ ]
set cmdheight=2

set updatetime=300

set shortmess+=c



inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:ale_fixers = {'javascript': ['prettier', 'standard', 'eslint'], 'html':['prettier'], 'python':['autopep8', 'yapf']}
nnoremap <leader>p :ALEFix<CR>
let g:ale_list_window_size = 0
let g:ale_fix_on_save = 1

let g:airline_powerline_fonts = 1



" setting html auto close tag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


highlight GitGutterAdd    ctermbg=NONE
highlight GitGutterChange ctermbg=NONE
highlight GitGutterDelete ctermbg=NONE
