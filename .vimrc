packadd minpac
call minpac#init()
call minpac#add("pangloss/vim-javascript")
call minpac#add("jelera/vim-javascript-syntax")
call minpac#add("mxw/vim-jsx")
call minpac#add("leshill/vim-json")
call minpac#add("kien/ctrlp.vim")
call minpac#add("tpope/vim-fugitive")
call minpac#add("tpope/vim-unimpaired")
call minpac#add("tpope/vim-surround")
call minpac#add("tpope/vim-repeat")
call minpac#add("tpope/vim-obsession")
call minpac#add("mileszs/ack.vim")
call minpac#add("altercation/vim-colors-solarized")
call minpac#add("sjl/gundo.vim")
call minpac#add("ternjs/tern_for_vim")
call minpac#add("w0rp/ale")
call minpac#add("vim-ruby/vim-ruby")

set nobackup
set nowritebackup
set noswapfile
set ts=2 sts=2 sw=2 expandtab
set number
set relativenumber
set wildignore+=*/node_modules/*,*/tmp/*,*/coverage/*
set shell=/usr/local/bin/fish
set hidden
set path+=**
set mouse=a
" set autochdir

set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}%=%-14.(%l,%c%)\ %L

set background=dark 
colorscheme solarized
syntax on
filetype plugin indent on
set copyindent
set autoindent
set smartindent

" the alt key will stop working as expected if your keyboard input
" source is set to "Unicode U+" instead of "English" or whatever.
map ˙ <c-[><c-w>h
map ∆ <c-[><c-w>j
map ˚ <c-[><c-w>k
map ¬ <c-[><c-w>l


" right - ¬, left - ˙, up - ˚, down - ∆

inoremap ˙ <c-[><c-w>h
inoremap ∆ <c-[><c-w>j
inoremap ˚ <c-[><c-w>k
inoremap ¬ <c-[><c-w>l

tnoremap <c-[><c-[> <c-\><c-n>
tnoremap ˙ <c-\><c-n><c-w>h
tnoremap ∆ <c-\><c-n><c-w>j
tnoremap ˚ <c-\><c-n><c-w>k
tnoremap ¬ <c-\><c-n><c-w>l

" Bubble single lines
nmap <c-k> [e
nmap <c-j> ]e
" Bubble multiple lines
vmap <c-k> [egv
vmap <c-j> ]egv

let g:neoterm_autoscroll=1

let g:ctrlp_map = '<c-p>'

let g:ackprg = 'ag --vimgrep'

let g:gundo_prefer_python3 = 1

" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier']
" let g:ale_fixers['scss'] = ['prettier']
" let g:ale_fixers['json'] = ['prettier']
let g:ale_fix_on_save = 1

set completeopt=longest,menuone,preview,noinsert

autocmd BufWritePre *.rb,*.jsx,*.py,*.js,*.scss :call <SID>StripTrailingWhitespaces()
autocmd BufEnter term://* startinsert

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <F6> :GundoToggle<CR>
