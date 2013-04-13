syntax on
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set autoindent
set laststatus=2
set confirm
set number
set pastetoggle=<F2> " Disable auto-indent for pasting blocks of text

" set background=dark

" enable status line always
" set laststatus=2

" change the status line based on mode
" if version >= 700
"	au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"	au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
" endif

 
" Mode Indication -Prominent!
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=red
    set cursorline
  elseif a:mode == 'r'
    hi statusline guibg=blue
  else
    hi statusline guibg= magenta
  endif
endfunction

function! InsertLeaveActions()
  hi statusline guibg=green
  set nocursorline
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default the statusline to green when entering Vim
hi statusline guibg=green

" have a permanent statusline to color
set laststatus=2

" KEYBINDINGS

" map CTRL-K to end-of-line delete
imap <C-k> <esc>d$<del>
imap <C-k> <C-c>

" imap "\eOF": end-of-line
"\e[F": end-of-line


" Fix home and end in Terminal.app
" end  \033OF
" home \033OH

