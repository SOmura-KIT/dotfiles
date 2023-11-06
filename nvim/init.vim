" 組込みプラグインの無効化
let g:loaded_gzip               = v:true
let g:loaded_tar                = v:true
let g:loaded_tarPlugin          = v:true
let g:loaded_zip                = v:true
let g:loaded_zipPlugin          = v:true
let g:loaded_rrhelper           = v:true
let g:loaded_2html_plugin       = v:true
let g:loaded_vimball            = v:true
let g:loaded_vimballPlugin      = v:true
let g:loaded_getscript          = v:true
let g:loaded_getscriptPlugin    = v:true
let g:loaded_logipat            = v:true
let g:loaded_matchparen         = v:true
let g:loaded_man                = v:true
" let g:loaded_netrw              = v:true
" let g:loaded_netrwPlugin        = v:true
" let g:loaded_netrwSettings      = v:true
" let g:loaded_netrwFileHandlers  = v:true

" プラグインの読み込み
lua require('plugin')

" オプション
set noautoindent
set autoread
set nobackup
set cursorcolumn
set cursorline
set expandtab
set hlsearch
set mouse=
set number
set relativenumber
set ruler
set shiftwidth=2
set showcmd
set splitright
set tabstop=2
set updatetime=300
set wrap
set writebackup

" キーマッピング
nnoremap <Space>ww :w<CR>
nnoremap <Space>qq :q<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <C-w>t <C-w>v<Cmd>term<CR>
nnoremap <C-w>T <C-w>s<C-w>j<Cmd>term<CR>
nnoremap j gj
nnoremap k gk
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

vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

tnoremap <C-[> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" autocmd
augroup AudoDisableIME
  autocmd!
  autocmd insertLeave * silent! :!fcitx5-remote -c
augroup END

" カラースキーム
colorscheme carbonfox
