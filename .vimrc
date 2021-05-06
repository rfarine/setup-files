set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'vim-syntastic/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'edkolev/tmuxline.vim'
Plug 'leafgarland/typescript-vim'
call plug#end()

colorscheme bubblegum-256-dark
set cursorline
set cursorcolumn

runtime macros/matchit.vim

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

filetype plugin indent on    " required

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:syntastic_ruby_checker = ['rubocop']
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

syntax enable

set autochdir
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab

set noswapfile
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
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
nnoremap / /\v
vnoremap / /\v
set smartcase
set showmatch

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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

packloadall
set rtp+=/usr/local/opt/fzf
" If installed using git
set rtp+=~/.fzf

" Remap fzf
nnoremap <silent> <C-p> :FZF<CR>
" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Javascript
let g:javascript_conceal_arrow_function = "⇒"

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" See `man fzf-tmux` for available options
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-d30%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

