
function! CustomJ() abort
  if v:count1 == 1
    return 'gj'
  endif
  return 'j'
endfunction

function! CustomK() abort
  if v:count1 == 1
    return 'gk'
  endif
  return 'k'
endfunction

nnoremap <Space>w <Cmd>w<CR>
nnoremap <C-w>t <C-w>v<Cmd>term<CR>
nnoremap <C-w>T <C-w>s<C-w>j<Cmd>term<CR>
nnoremap <expr> j CustomJ()
nnoremap <expr> k CustomK()
nnoremap gj j
nnoremap gk k
nnoremap <ESC> <C-c>
nnoremap <C-[> <C-c>

inoremap <C-d> <Del>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <Right> <C-t>
inoremap <Left> <C-d>

cnoremap <C-d> <Del>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <ESC> <C-c>
cnoremap <C-[> <C-c>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

vnoremap <expr> j CustomJ()
vnoremap <expr> k CustomK()
vnoremap gj j
vnoremap gk k

tnoremap <C-[> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
