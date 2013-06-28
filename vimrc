" Settings
" =================

" basic syntax and layout settings
syntax on
set t_Co=256
set ts=2 sts=2 sw=2 et
set textwidth=80 wrap
set number ruler incsearch
colorscheme jellybeans
filetype plugin indent on

" case-specific syntax
set cinkeys-=0# cino=:g0
au FileType python setl ts=4 sts=4 sw=4


" Command Shortcuts
" =================

" quick command shortcuts
nmap ; :
imap ;, <Esc>
vmap ;, <Esc>
nmap ' "
vmap ' "

" fn key shortcuts
map <F2> :set wrap!<CR>
map <F3> :set hlsearch!<CR>
map <F4> :set number!<CR>

" navigate wrapped lines as display lines
map j gj
map k gk

" programmer-pvorak numbers-> punctuation in normal mode
noremap [ 7
noremap { 5
noremap } 3
noremap ( 1
noremap = 9
noremap * 0
noremap ) 2
noremap + 4
noremap ] 6
noremap ! 8
noremap 7 [
noremap 5 {
noremap 3 }
noremap 1 (
noremap 9 =
noremap 0 *
noremap 2 )
noremap 4 +
noremap 6 ]
noremap 8 !


" mapleader Shortcuts
" =================
let mapleader = ","

map <leader>t :TlistOpen<CR>
map <leader>w <C-w><C-w>


" Scripts
" =================

" <remember cursor position>
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
" </remember cursor position> source: vim.wikia.com


" <swap window buffers>
function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  let markedBuf = bufnr( "%" )
  exe 'hide buf' curBuf
  exe curNum . "wincmd w"
  exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>w :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
" </swap window buffers> source: stackoverflow.com
