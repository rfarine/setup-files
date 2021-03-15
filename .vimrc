set nocompatible
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

syntax enable

set autochdir
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab

set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 space
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set visualbell
set cursorline
set ttyfast
set showmode
set hidden
set hls
set nu
set listchars=tab:▸\ ,eol:¬
set textwidth=120
nnoremap / /\v
vnoremap / /\v
set smartcase
set showmatch
set runtimepath^=~/.vim/bundle/ctrlp.vim

" COMMENCE CUSTOMIZATION

set statusline+=%F
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim


" Pane minimizing
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Toggle paste mode
map <leader>pp :setlocal paste!<cr>

" Tab nav
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>"
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Open v-split and select
nnoremap <leader>w <C-w>v<C-w>l


" Remove spaces at the end of a line
autocmd BufWritePre * :%s/\s\+$//e
set nocompatible
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Vim Pathogen
execute pathogen#infect()

packloadall
let g:prettier#autoformat_config_present = 1
