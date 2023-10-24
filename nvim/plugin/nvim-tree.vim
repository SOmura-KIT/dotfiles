" キーマップ
nnoremap <Space>f <CMD>NvimTreeFocus<CR>
nnoremap <Space>g <CMD>NvimTreeClose<CR>

" autocmd
function! s:OpenTreeWhenOpenNoFile() abort
  if bufname() == ""
    execute "NvimTreeOpen"
  endif
endfunction

augroup OpenTreeWhenOpenNoFIle
  autocmd!
  autocmd VimEnter * call s:OpenTreeWhenOpenNoFile()
augroup END
