set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect('bundle/{}')

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hides buffers instead of closing them.
" This means that you can have unwritten changes to a file and open a new file
" using :e, without being forced to write or undo your changes first. Also, 
" undo buffers and marks are preserved while the buffer is open.
set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
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
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set cursorline		" highlight current line
set showtabline=2	" always show tabs 
set laststatus=2	" always show status bas
syntax enable		" enable syntax highlighting
set wildmenu 		" Better command-line completion
set scrolloff=10 	" Always keep 10 lines after or before when scrolling
set sidescrolloff=5 " Always keep 5 lines after or before when side scrolling
set noshowmode 		" Don't display the current mode
set showbreak=↪ 		" See this char when wrapping text

set list listchars=tab:»·,trail:·,nbsp:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

""" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=1000 
au InsertEnter * set timeout
au InsertLeave * set notimeout

" w!! -> when you forget to open a file with sudo
cmap w!! w !sudo tee % >/dev/null

"NERDTree
let g:NERDTreeWinPos = "right" " put nerdtree on the right
let NERDTreeShowHidden=1 " show hidden files in nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " closes vim if nerdtree is the only remaining window
map <Leader>n :NERDTreeToggle<CR>

" CtrlP config
let g:ctrlp_map = '<c-p>' " ctrl+p for fuzzy find files
let g:ctrlp_cmd = 'CtrlP'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Multicursors config
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" theme
set background=dark
color lucius

" airline
let g:airline_powerline_fonts = 1

" nohl
map <Leader>h :nohl<CR>

" Various practical shortcuts
map <Leader>a gT
map <Leader>z gt
map <F8> gt " F8 for next tab
map <F7> gT " F7 is for previous tab

" Syntax
autocmd BufNewFile,BufReadPost *.adoc set syntax=asciidoc
autocmd BufNewFile,BufReadPost *.adoc set cc=80 

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor


